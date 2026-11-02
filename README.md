# PLSQL IDE

A modern, lightweight Oracle / PL/SQL IDE for macOS.

**[Download the latest version](https://github.com/odilovsanjarbek/plsql-ide-releases/releases/latest)**

[English](#en) · [Oʻzbekcha](#uz) · [Özbekça](#uz-new)

<a name="en"></a>

## English

### What you need

- macOS 13 or later, on Apple Silicon or Intel
- Oracle Instant Client (step 3 below)
- Access to an Oracle database

### Install

1. Download `PLSQL-IDE-<version>-universal.dmg` from [Releases](https://github.com/odilovsanjarbek/plsql-ide-releases/releases/latest), open it and drag **PLSQL IDE** to **Applications**.
2. Open the app. macOS stops it the first time, because this version is not notarized by Apple yet. Click **Done**, go to **System Settings → Privacy & Security**, scroll down, click **Open Anyway** and confirm.
3. Install Oracle Instant Client. Download the **Basic** or **Basic Light** package for your Mac: [Apple Silicon](https://www.oracle.com/database/technologies/instant-client/macos-arm64-downloads.html) or [Intel](https://www.oracle.com/database/technologies/instant-client/macos-intel-x86-downloads.html). Open the `.dmg`, then run Oracle's script in Terminal:

   ```bash
   cd /Volumes/instantclient-*
   sh ./install_ic.sh
   ```

   Then move the client to `~/oracle`:

   ```bash
   mkdir -p ~/oracle
   mv ~/Downloads/instantclient_* ~/oracle/
   ```

   Oracle's script puts the client in `Downloads`, and PLSQL IDE does not search that folder, for safety. A client in `~/oracle` is found automatically. To keep it anywhere else, set its folder in **Tools → Preferences → Oracle Client → Client folder**.
4. Open **Session → Log on…**. In **Database**, enter a TNS alias, `host:port/service` or a full descriptor. If you use `tnsnames.ora`, put it in `~/oracle/network/admin`, or choose it in **Tools → Preferences → Oracle Client → TNS names**.

### Troubleshooting

- **`Oracle Instant Client not found`**: the client is not in `~/oracle`, or its folder has no `libclntsh.dylib`. Repeat step 3, or set the folder in Preferences.
- **`Cannot load the Oracle Client`**: the package must match your Mac: ARM64 for Apple Silicon, x64 for Intel.
- Anything else: write to [Issues](https://github.com/odilovsanjarbek/plsql-ide-releases/issues).

PLSQL IDE is not affiliated with Oracle. Oracle and PL/SQL are trademarks of Oracle and/or its affiliates. Oracle Instant Client is downloaded from Oracle and used under Oracle's license.

<a name="uz"></a>

## Oʻzbekcha

### Nima kerak

- macOS 13 yoki yangiroq, Apple Silicon yoki Intel
- Oracle Instant Client (quyidagi 3-qadam)
- Oracle bazasiga kirish huquqi

### Oʻrnatish

1. [Releases](https://github.com/odilovsanjarbek/plsql-ide-releases/releases/latest) sahifasidan `PLSQL-IDE-<version>-universal.dmg` faylini yuklab oling, uni oching va **PLSQL IDE** ni **Applications** papkasiga torting.
2. Ilovani oching. Birinchi marta macOS uni toʻxtatadi, chunki bu versiya hali Apple tomonidan notarize qilinmagan. **Done** tugmasini bosing, **System Settings → Privacy & Security** ga oʻting, pastga tushib **Open Anyway** ni bosing va tasdiqlang.
3. Oracle Instant Clientʼni oʻrnating. Macʼingizga mos **Basic** yoki **Basic Light** paketini yuklab oling: [Apple Silicon](https://www.oracle.com/database/technologies/instant-client/macos-arm64-downloads.html) yoki [Intel](https://www.oracle.com/database/technologies/instant-client/macos-intel-x86-downloads.html). `.dmg` faylini oching, keyin Terminalʼda Oracle skriptini ishga tushiring:

   ```bash
   cd /Volumes/instantclient-*
   sh ./install_ic.sh
   ```

   Keyin clientʼni `~/oracle` ga koʻchiring:

   ```bash
   mkdir -p ~/oracle
   mv ~/Downloads/instantclient_* ~/oracle/
   ```

   Oracle skripti clientʼni `Downloads` papkasiga qoʻyadi, PLSQL IDE esa xavfsizlik uchun u yerni qidirmaydi. `~/oracle` dagi client avtomatik topiladi. Boshqa joyda saqlasangiz, papkasini **Tools → Preferences → Oracle Client → Client folder** da koʻrsating.
4. **Session → Log on…** ni oching. **Database** maydoniga TNS alias, `host:port/service` yoki toʻliq descriptor yozing. `tnsnames.ora` ishlatsangiz, uni `~/oracle/network/admin` ga qoʻying yoki **Tools → Preferences → Oracle Client → TNS names** da tanlang.

### Muammolar

- **`Oracle Instant Client not found`**: client `~/oracle` da yoʻq yoki uning papkasida `libclntsh.dylib` yoʻq. 3-qadamni takrorlang yoki papkani Preferencesʼda koʻrsating.
- **`Cannot load the Oracle Client`**: paket Macʼingizga mos boʻlishi kerak: Apple Silicon uchun ARM64, Intel uchun x64.
- Boshqa muammo boʻlsa, [Issues](https://github.com/odilovsanjarbek/plsql-ide-releases/issues) boʻlimiga yozing.

PLSQL IDE Oracle kompaniyasiga aloqador emas. Oracle va PL/SQL Oracle va uning sheriklariga tegishli savdo belgilaridir. Oracle Instant Client Oracle saytidan yuklab olinadi va Oracle litsenziyasi asosida ishlatiladi.

<a name="uz-new"></a>

## Özbekça

### Nima kerak

- macOS 13 yoki yangiroq, Apple Silicon yoki Intel
- Oracle Instant Client (quyidagi 3-qadam)
- Oracle bazasiga kiriş huquqi

### Örnatiş

1. [Releases](https://github.com/odilovsanjarbek/plsql-ide-releases/releases/latest) sahifasidan `PLSQL-IDE-<version>-universal.dmg` faylini yuklab oling, uni oçing va **PLSQL IDE** ni **Applications** papkasiga torting.
2. Ilovani oçing. Birinçi marta macOS uni töxtatadi, çunki bu versiya hali Apple tomonidan notarize qilinmagan. **Done** tugmasini bosing, **System Settings → Privacy & Security** ga öting, pastga tuşib **Open Anyway** ni bosing va tasdiqlang.
3. Oracle Instant Clientʼni örnating. Macʼingizga mos **Basic** yoki **Basic Light** paketini yuklab oling: [Apple Silicon](https://www.oracle.com/database/technologies/instant-client/macos-arm64-downloads.html) yoki [Intel](https://www.oracle.com/database/technologies/instant-client/macos-intel-x86-downloads.html). `.dmg` faylini oçing, keyin Terminalʼda Oracle skriptini işga tuşiring:

   ```bash
   cd /Volumes/instantclient-*
   sh ./install_ic.sh
   ```

   Keyin clientʼni `~/oracle` ga köçiring:

   ```bash
   mkdir -p ~/oracle
   mv ~/Downloads/instantclient_* ~/oracle/
   ```

   Oracle skripti clientʼni `Downloads` papkasiga qöyadi, PLSQL IDE esa xavfsizlik uçun u yerni qidirmaydi. `~/oracle` dagi client avtomatik topiladi. Boşqa joyda saqlasangiz, papkasini **Tools → Preferences → Oracle Client → Client folder** da körsating.
4. **Session → Log on…** ni oçing. **Database** maydoniga TNS alias, `host:port/service` yoki töliq descriptor yozing. `tnsnames.ora` işlatsangiz, uni `~/oracle/network/admin` ga qöying yoki **Tools → Preferences → Oracle Client → TNS names** da tanlang.

### Muammolar

- **`Oracle Instant Client not found`**: client `~/oracle` da yöq yoki uning papkasida `libclntsh.dylib` yöq. 3-qadamni takrorlang yoki papkani Preferencesʼda körsating.
- **`Cannot load the Oracle Client`**: paket Macʼingizga mos bölişi kerak: Apple Silicon uçun ARM64, Intel uçun x64.
- Boşqa muammo bölsa, [Issues](https://github.com/odilovsanjarbek/plsql-ide-releases/issues) bölimiga yozing.

PLSQL IDE Oracle kompaniyasiga aloqador emas. Oracle va PL/SQL Oracle va uning şeriklariga tegişli savdo belgilaridir. Oracle Instant Client Oracle saytidan yuklab olinadi va Oracle litsenziyasi asosida işlatiladi.
