# Installs or updates Nectar on Windows and, when no Oracle Client is found,
# Oracle Instant Client.
# Usage (PowerShell): irm https://raw.githubusercontent.com/odilovsanjarbek/nectar-releases/main/install.ps1 | iex
# (Kept ASCII: PowerShell may read a downloaded script in the system code page.)

& {
  $ErrorActionPreference = "Stop"
  # Windows PowerShell draws a progress bar per downloaded chunk, which slows downloads to a crawl.
  $ProgressPreference = "SilentlyContinue"
  # Older Windows 10 builds offer TLS 1.0 first; GitHub and Oracle need 1.2.
  [Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12

  $Repo = "odilovsanjarbek/nectar-releases"
  $OracleZip = "https://download.oracle.com/otn_software/nt/instantclient/instantclient-basic-windows.zip"
  $OracleDir = Join-Path $env:USERPROFILE "oracle"

  function Fail([string]$message) {
    Write-Host $message -ForegroundColor Red
    throw $message
  }

  # An oci.dll the app would load: on PATH, in ORACLE_HOME, or where this script puts one.
  function Find-OracleClient {
    $onPath = Get-Command oci.dll -ErrorAction SilentlyContinue | Select-Object -First 1
    if ($onPath) { return Split-Path $onPath.Source }
    if ($env:ORACLE_HOME) {
      foreach ($dir in (Join-Path $env:ORACLE_HOME "bin"), $env:ORACLE_HOME) {
        if (Test-Path (Join-Path $dir "oci.dll")) { return $dir }
      }
    }
    $ours = Get-ChildItem $OracleDir -Directory -Filter "instantclient_*" -ErrorAction SilentlyContinue |
      Where-Object { Test-Path (Join-Path $_.FullName "oci.dll") } | Sort-Object Name -Descending | Select-Object -First 1
    if ($ours) { return $ours.FullName }
    return $null
  }

  # The folder on the user's PATH (this window's too), where the app looks for oci.dll.
  function Add-ToUserPath([string]$dir) {
    $userPath = [Environment]::GetEnvironmentVariable("Path", "User")
    $parts = @($userPath -split ";" | Where-Object { $_ })
    if ($parts -notcontains $dir) {
      [Environment]::SetEnvironmentVariable("Path", (($parts + $dir) -join ";"), "User")
    }
    if (($env:Path -split ";") -notcontains $dir) { $env:Path = "$env:Path;$dir" }
  }

  if (-not [Environment]::Is64BitOperatingSystem) { Fail "Nectar needs 64-bit Windows." }
  if (Get-Process -Name nectar -ErrorAction SilentlyContinue) { Fail "Close Nectar first, then run this again." }

  $work = Join-Path $env:TEMP ("nectar-install-" + [guid]::NewGuid().ToString("N"))
  New-Item -ItemType Directory -Path $work | Out-Null
  try {
    # The latest release's update feed names its Windows installer.
    try {
      $feed = Invoke-RestMethod "https://github.com/$Repo/releases/latest/download/latest.json"
    } catch {
      Fail "No published release yet: https://github.com/$Repo/releases"
    }
    $windows = $feed.platforms."windows-x86_64"
    if (-not $windows) { Fail "Nectar $($feed.version) has no Windows version yet: https://github.com/$Repo/releases" }

    Write-Host "Downloading Nectar $($feed.version)..."
    $setup = Join-Path $work "Nectar-setup.exe"
    Invoke-WebRequest $windows.url -OutFile $setup -UseBasicParsing
    Write-Host "Installing..."
    # /S: NSIS without its pages; for this user, no administrator rights.
    $process = Start-Process $setup -ArgumentList "/S" -Wait -PassThru
    if ($process.ExitCode -ne 0) { Fail "The installer stopped with code $($process.ExitCode)." }

    $client = Find-OracleClient
    if ($client) {
      Write-Host "Oracle Client found: $client"
    } else {
      Write-Host "Downloading Oracle Instant Client from Oracle (about 140 MB)..."
      $zip = Join-Path $work "instantclient.zip"
      Invoke-WebRequest $OracleZip -OutFile $zip -UseBasicParsing
      New-Item -ItemType Directory -Force -Path $OracleDir | Out-Null
      Expand-Archive $zip -DestinationPath $OracleDir -Force
      $client = Find-OracleClient
      if (-not $client) { Fail "The Oracle download has no oci.dll." }
      Add-ToUserPath $client
      Write-Host "Oracle Instant Client is in $client (added to your PATH). Its license: $client\BASIC_LICENSE"
      Write-Host "It needs the Microsoft Visual C++ Redistributable; if Nectar cannot load it, install that from Microsoft."
    }

    $app = Get-ChildItem (Join-Path $env:LOCALAPPDATA "Nectar") -Filter "*.exe" -ErrorAction SilentlyContinue |
      Where-Object { $_.Name -notlike "uninstall*" } | Select-Object -First 1
    if ($app) {
      Write-Host "Nectar is installed. Opening it..." -ForegroundColor Green
      Start-Process $app.FullName
    } else {
      Write-Host "Nectar is installed: open it from the Start menu." -ForegroundColor Green
    }
  } finally {
    Remove-Item $work -Recurse -Force -ErrorAction SilentlyContinue
  }
}
