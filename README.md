# Nectar

A modern, lightweight Oracle / PL/SQL IDE for macOS.

[English](#en) · [Oʻzbekcha](#uz) · [Özbekça](#uz-new)

<a name="en"></a>

## English

### Install

You need macOS 13 or later, on Apple Silicon or Intel. Open Terminal and run:

```bash
curl -fsSL https://odilovsanjarbek.github.io/nectar | bash
```

The command installs Nectar in **Applications** and opens it. If Oracle Instant Client is missing, it also downloads the client from Oracle to `~/oracle`.

### Update

From version 0.2.0 the app offers new versions itself: a button appears in the status bar, or choose **Help → Check for Updates…**. On version 0.1.0, close the app and run the same command again.

### First logon

Open **Session → Log on…**. In **Database**, enter a TNS alias, `host:port/service` or a full descriptor. If you use `tnsnames.ora`, put it in `~/oracle/network/admin`, or choose it in **Tools → Preferences → Oracle Client → TNS names**.

### Install by hand

<details>
<summary>Show the steps</summary>

1. Download `Nectar-<version>-universal.dmg` from [Releases](https://github.com/odilovsanjarbek/nectar-releases/releases/latest), open it and drag **Nectar** to **Applications**.
2. Open the app. macOS stops it the first time, because this version is not notarized by Apple yet. Click **Done**, go to **System Settings → Privacy & Security**, scroll down, click **Open Anyway** and confirm.
3. Download the **Basic** package of Oracle Instant Client for your Mac: [Apple Silicon](https://www.oracle.com/database/technologies/instant-client/macos-arm64-downloads.html) or [Intel](https://www.oracle.com/database/technologies/instant-client/macos-intel-x86-downloads.html). Open the `.dmg`, then run Oracle's script in Terminal and move the client to `~/oracle`:

   ```bash
   cd /Volumes/instantclient-*
   sh ./install_ic.sh
   mkdir -p ~/oracle
   mv ~/Downloads/instantclient_* ~/oracle/
   ```

   Nectar finds a client in `~/oracle` automatically, but does not search `Downloads`, for safety. To keep it anywhere else, set its folder in **Tools → Preferences → Oracle Client → Client folder**.

</details>

### Troubleshooting

- **`Oracle Instant Client not found`**: the client is not in `~/oracle`, or its folder has no `libclntsh.dylib`. Run the install command again, or set the folder in Preferences.
- **`Cannot load the Oracle Client`**: the package must match your Mac: ARM64 for Apple Silicon, x64 for Intel.
- Anything else: write to [Issues](https://github.com/odilovsanjarbek/nectar-releases/issues).

Nectar is not affiliated with Oracle. Oracle and PL/SQL are trademarks of Oracle and/or its affiliates. Oracle Instant Client is downloaded from Oracle and used under Oracle's license.

<a name="uz"></a>

## Oʻzbekcha

### Oʻrnatish

macOS 13 yoki yangiroq kerak, Apple Silicon yoki Intel. Terminalʼni oching va buni ishga tushiring:

```bash
curl -fsSL https://odilovsanjarbek.github.io/nectar | bash
```

Buyruq Nectarʼni **Applications** papkasiga oʻrnatadi va ochadi. Oracle Instant Client boʻlmasa, uni ham Oracle saytidan `~/oracle` ga yuklab oladi.

### Yangilash

0.2.0 versiyadan boshlab ilova yangi versiyani oʻzi taklif qiladi: status barʼda tugma chiqadi yoki **Help → Check for Updates…** ni tanlang. 0.1.0 versiyada ilovani yoping va xuddi shu buyruqni qayta ishga tushiring.

### Birinchi ulanish

**Session → Log on…** ni oching. **Database** maydoniga TNS alias, `host:port/service` yoki toʻliq descriptor yozing. `tnsnames.ora` ishlatsangiz, uni `~/oracle/network/admin` ga qoʻying yoki **Tools → Preferences → Oracle Client → TNS names** da tanlang.

### Qoʻlda oʻrnatish

<details>
<summary>Bosqichlarni koʻrsatish</summary>

1. [Releases](https://github.com/odilovsanjarbek/nectar-releases/releases/latest) sahifasidan `Nectar-<version>-universal.dmg` faylini yuklab oling, uni oching va **Nectar**ʼni **Applications** papkasiga torting.
2. Ilovani oching. Birinchi marta macOS uni toʻxtatadi, chunki bu versiya hali Apple tomonidan notarize qilinmagan. **Done** tugmasini bosing, **System Settings → Privacy & Security** ga oʻting, pastga tushib **Open Anyway** ni bosing va tasdiqlang.
3. Macʼingizga mos Oracle Instant Client **Basic** paketini yuklab oling: [Apple Silicon](https://www.oracle.com/database/technologies/instant-client/macos-arm64-downloads.html) yoki [Intel](https://www.oracle.com/database/technologies/instant-client/macos-intel-x86-downloads.html). `.dmg` faylini oching, keyin Terminalʼda Oracle skriptini ishga tushirib, clientʼni `~/oracle` ga koʻchiring:

   ```bash
   cd /Volumes/instantclient-*
   sh ./install_ic.sh
   mkdir -p ~/oracle
   mv ~/Downloads/instantclient_* ~/oracle/
   ```

   Nectar `~/oracle` dagi clientʼni avtomatik topadi, lekin xavfsizlik uchun `Downloads` papkasini qidirmaydi. Boshqa joyda saqlasangiz, papkasini **Tools → Preferences → Oracle Client → Client folder** da koʻrsating.

</details>

### Muammolar

- **`Oracle Instant Client not found`**: client `~/oracle` da yoʻq yoki uning papkasida `libclntsh.dylib` yoʻq. Oʻrnatish buyrugʻini qayta ishga tushiring yoki papkani Preferencesʼda koʻrsating.
- **`Cannot load the Oracle Client`**: paket Macʼingizga mos boʻlishi kerak: Apple Silicon uchun ARM64, Intel uchun x64.
- Boshqa muammo boʻlsa, [Issues](https://github.com/odilovsanjarbek/nectar-releases/issues) boʻlimiga yozing.

Nectar Oracle kompaniyasiga aloqador emas. Oracle va PL/SQL Oracle va uning sheriklariga tegishli savdo belgilaridir. Oracle Instant Client Oracle saytidan yuklab olinadi va Oracle litsenziyasi asosida ishlatiladi.

<a name="uz-new"></a>

## Özbekça

### Örnatiş

macOS 13 yoki yangiroq kerak, Apple Silicon yoki Intel. Terminalʼni oçing va buni işga tuşiring:

```bash
curl -fsSL https://odilovsanjarbek.github.io/nectar | bash
```

Buyruq Nectarʼni **Applications** papkasiga örnatadi va oçadi. Oracle Instant Client bölmasa, uni ham Oracle saytidan `~/oracle` ga yuklab oladi.

### Yangilaş

0.2.0 versiyadan boşlab ilova yangi versiyani özi taklif qiladi: status barʼda tugma çiqadi yoki **Help → Check for Updates…** ni tanlang. 0.1.0 versiyada ilovani yoping va xuddi şu buyruqni qayta işga tuşiring.

### Birinçi ulaniş

**Session → Log on…** ni oçing. **Database** maydoniga TNS alias, `host:port/service` yoki töliq descriptor yozing. `tnsnames.ora` işlatsangiz, uni `~/oracle/network/admin` ga qöying yoki **Tools → Preferences → Oracle Client → TNS names** da tanlang.

### Qölda örnatiş

<details>
<summary>Bosqiçlarni körsatiş</summary>

1. [Releases](https://github.com/odilovsanjarbek/nectar-releases/releases/latest) sahifasidan `Nectar-<version>-universal.dmg` faylini yuklab oling, uni oçing va **Nectar**ʼni **Applications** papkasiga torting.
2. Ilovani oçing. Birinçi marta macOS uni töxtatadi, çunki bu versiya hali Apple tomonidan notarize qilinmagan. **Done** tugmasini bosing, **System Settings → Privacy & Security** ga öting, pastga tuşib **Open Anyway** ni bosing va tasdiqlang.
3. Macʼingizga mos Oracle Instant Client **Basic** paketini yuklab oling: [Apple Silicon](https://www.oracle.com/database/technologies/instant-client/macos-arm64-downloads.html) yoki [Intel](https://www.oracle.com/database/technologies/instant-client/macos-intel-x86-downloads.html). `.dmg` faylini oçing, keyin Terminalʼda Oracle skriptini işga tuşirib, clientʼni `~/oracle` ga köçiring:

   ```bash
   cd /Volumes/instantclient-*
   sh ./install_ic.sh
   mkdir -p ~/oracle
   mv ~/Downloads/instantclient_* ~/oracle/
   ```

   Nectar `~/oracle` dagi clientʼni avtomatik topadi, lekin xavfsizlik uçun `Downloads` papkasini qidirmaydi. Boşqa joyda saqlasangiz, papkasini **Tools → Preferences → Oracle Client → Client folder** da körsating.

</details>

### Muammolar

- **`Oracle Instant Client not found`**: client `~/oracle` da yöq yoki uning papkasida `libclntsh.dylib` yöq. Örnatiş buyruğini qayta işga tuşiring yoki papkani Preferencesʼda körsating.
- **`Cannot load the Oracle Client`**: paket Macʼingizga mos bölişi kerak: Apple Silicon uçun ARM64, Intel uçun x64.
- Boşqa muammo bölsa, [Issues](https://github.com/odilovsanjarbek/nectar-releases/issues) bölimiga yozing.

Nectar Oracle kompaniyasiga aloqador emas. Oracle va PL/SQL Oracle va uning şeriklariga tegişli savdo belgilaridir. Oracle Instant Client Oracle saytidan yuklab olinadi va Oracle litsenziyasi asosida işlatiladi.
