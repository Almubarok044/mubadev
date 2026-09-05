```markdown
# 👨‍💻 Mubadev

Portfolio website dan aplikasi personal berbasis **Flutter** 🚀 yang menampilkan profil, proyek, keahlian, pengalaman, serta kontak. Aplikasi ini dirancang sebagai *landing page* personal yang responsif dan multi-platform, dilengkapi dengan dukungan tema gelap/terang 🌙/☀️ serta lokalisasi Bahasa Indonesia dan Inggris 🇮🇩/🇬🇧.

---

## 📌 Ringkasan Proyek

Proyek ini dibuat untuk menampilkan identitas dan karya dari **Mohamad Almubarok** sebagai pengembang aplikasi dan *software engineer*. UI utamanya terdiri dari:

- 🏠 **Halaman Beranda / Hero Section**
- 👤 **Halaman Tentang Saya**
- ⚡ **Halaman Keahlian**
- 📂 **Halaman Proyek / Portofolio**
- 🔍 **Halaman Detail Proyek**
- 📬 **Halaman Kontak**

📱💻 Aplikasi ini dapat dijalankan di berbagai platform supported Flutter seperti **Android, iOS, Web, Linux, macOS, dan Windows**.

---

## 🛠️ Teknologi yang Digunakan

- 💙 **Flutter** (Cross-platform Framework)
- 🎯 **Dart** (Programming Language)
- 🎨 **Material 3** (Design System)
- 🌐 **easy_localization** (Internationalization)
- 🖼️ **flutter_svg** (SVG Support)
- 🔗 **url_launcher** (External Links Launcher)
- 🎨 **font_awesome_flutter** (Icon Pack)

---

## 📂 Struktur Folder

```text
mubadev/
├── 🤖 android/
├── 🍎 ios/
├── 🐧 linux/
├── 💻 macos/
├── 🪟 windows/
├── 🌐 web/
├── 📦 assets/
│   ├── 🎨 icon/
│   ├── 🖼️ images/
│   └── 🌐 translations/
├── 🧠 lib/
│   ├── ⚙️ core/
│   │   ├── 🎨 constants/
│   │   ├── 🎭 theme/
│   │   └── 🧩 widgets/
│   ├── 🍱 features/
│   │   ├── 👤 about/
│   │   ├── 📬 contact/
│   │   ├── 🏠 home/
│   │   └── 📂 portfolio/
│   └── 🏁 main.dart
├── 📋 analysis_options.yaml
├── 📦 pubspec.yaml
├── 📜 README.md
└── 🧪 test/

```

---

## 🏗️ Arsitektur Aplikasi

### 1. 🏁 Entry Point

Aplikasi dimulai dari `lib/main.dart`. Pada file ini dilakukan:

* 🌐 Inisialisasi `EasyLocalization`
* 🗺️ Menetapkan *locale* default dan yang didukung
* 🎨 Menyiapkan `ThemeManager`
* 🛣️ Mengatur *route generator* untuk navigasi antar halaman
* 🖱️ Menambahkan `InteractiveCursor` sebagai *wrapping* global untuk efek kursor interaktif

### 2. 🎭 Theme dan Styling

Folder `lib/core/theme/` berisi konfigurasi tampilan aplikasi:

* 🎨 `app_colors.dart`: Definisi warna utama, *gradient*, dan *helper* warna berdasarkan tema
* 🌗 `theme_manager.dart`: Pengelola mode gelap/terang dengan `ValueNotifier<ThemeMode>`

### 3. 🧩 Layout Umum

Folder `lib/core/widgets/` berisi komponen reusable:

* 📐 `page_layout.dart`: Layout utama dengan navbar, latar belakang grid, dan footer
* 🧭 `custom_navbar.dart`: Navigasi utama serta tombol *toggle* tema dan bahasa
* 🦶 `custom_footer.dart`: Footer dengan tautan media sosial
* 🖱️ `interactive_cursor.dart`: Efek kursor custom dan region khusus
* 📱 `responsive_layout.dart`: Helper layout responsif
* 📜 `infinite_marquee.dart`: Komponen *marquee* untuk animasi tampilan keahlian

### 4. 🍱 Feature-based Structure

Setiap fitur dipisah berdasarkan domain:

* 🏠 `features/home`: Beranda / *hero section* dan *project highlight*
* 👤 `features/about`: Halaman tentang, *skills*, dan *experience*
* 📂 `features/portfolio`: Daftar proyek dan detail proyek
* 📬 `features/contact`: Form kontak dan info kontak

---

## ✨ Fitur Utama

* 🏠 **Halaman Beranda**
* Hero text dengan nama dan tagline
* Tombol navigasi ke proyek dan kontak
* *Project highlight card*
* Desain modern dengan efek hover & custom cursor


* 📂 **Halaman Portofolio**
* Daftar proyek dalam bentuk *grid*
* Navigasi menuju detail proyek
* Informasi kategori, teknologi, dan deskripsi singkat


* 🔍 **Halaman Detail Proyek**
* Preview gambar proyek
* Deskripsi latar belakang & fitur utama
* Stack teknologi yang dipakai


* 👤 **Halaman Tentang**
* Profil singkat dan deskripsi diri
* Layout responsif untuk mobile & desktop


* ⚡ **Halaman Keahlian**
* *Skill card* dengan animasi marquee
* Menampilkan stack teknologi dan *tools*


* 📬 **Halaman Kontak**
* Form pesan & info kontak
* Tombol tautan media sosial


* 💡 **Fitur Tambahan**
* 🌗 Dark mode / Light mode
* 🌐 Dukungan dua bahasa: Indonesia 🇮🇩 dan Inggris 🇬🇧
* 📱 Layout responsif untuk berbagai ukuran layar
* ✨ Efek hover dan animasi mikro untuk UI dinamis



---

## 🛣️ Routing

Aplikasi menggunakan `onGenerateRoute` di `lib/main.dart` dengan *route* sebagai berikut:

| Route | Halaman / Screen | Deskripsi |
| --- | --- | --- |
| `/` | 🏠 `HomeScreen` | Halaman Utama / Hero |
| `/work` | 📂 `PortfolioScreen` | Daftar Portofolio |
| `/project_detail` | 🔍 `ProjectDetailScreen` | Detail Informasi Proyek |
| `/about` | 👤 `AboutScreen` | Profil & Deskripsi |
| `/skills` | ⚡ `SkillsScreen` | Daftar Keahlian |
| `/experience` | 💼 `ExperienceScreen` | Pengalaman Kerja |
| `/contact` | 📬 `ContactScreen` | Form & Informasi Kontak |

---

## 📊 Data Proyek

Data proyek tersimpan secara terstruktur di `lib/features/portfolio/models/project_model.dart`.

Contoh beberapa proyek sampel:

* 🌿 **Hidroponik App**
* 🧾 **Invoice-Based Sales System**
* 🛠️ **Welding Workshop**
* 🍦 **Ice Mambo Lasmi**

Setiap data model memuat:

`id` • `title` • `subtitle` • `category` • `shortDescription` • `fullDescription` • `imageAsset` • `technologies` • `features`

---

## 🌐 Localization

File terjemahan tersimpan pada folder `assets/translations/`:

* 🇬🇧 `en.json` (English)
* 🇮🇩 `id.json` (Bahasa Indonesia)

Pengelolaan bahasa menggunakan paket `easy_localization` ⚡ untuk pergantian bahasa secara *real-time*.

---

## 🚀 Setup dan Menjalankan Aplikasi

### 1. ⚙️ Prasyarat

Pastikan Flutter SDK sudah terpasang di sistem Anda.

```bash
flutter --version

```

### 2. 📥 Install Dependensi

Unduh paket/library yang dibutuhkan:

```bash
flutter pub get

```

### 3. ▶️ Jalankan Aplikasi

Jalankan pada *device/emulator* default:

```bash
flutter run

```

Jalankan khusus di browser (Web):

```bash
flutter run -d chrome

```

### 📦 Build Produksi

* **Versi Web:**
```bash
flutter build web

```


* **Versi Android (APK):**
```bash
flutter build apk

```



---

## ⚠️ Catatan Penting

* 🏗️ Sebagian halaman masih merupakan *prototype* atau *placeholder* (misalnya halaman pengalaman/`ExperienceScreen`).
* 📮 Form kontak pada halaman kontak masih bersifat statis dan belum terhubung ke service backend/email.
* 🔗 Tautan media sosial dan navigasi dasar sudah siap digunakan dan dapat disesuaikan kembali sesuai kebutuhan *branding*.

---

## 🔮 Pengembangan Selanjutnya

Rencana fitur dan peningkatan di masa mendatang:

* 🧱 Backend terintegrasi untuk form kontak
* 📜 Halaman pengalaman kerja berbasis *interactive timeline*
* 📰 Integrasi CMS atau API/JSON eksternal untuk data proyek
* 📈 Integrasi Web Analytics
* 🔍 Optimasi SEO (Search Engine Optimization) untuk versi Web
* 🧪 Unit Testing & Widget Testing

---

## 🤝 Kontribusi

Proyek ini dibuat untuk kebutuhan portofolio dan *personal branding*. Jika ingin menyesuaikan konten:

* 📱 `lib/features/...` → Modifikasi layar dan komponen UI
* 🌐 `assets/translations/*.json` → Edit teks/label terjemahan
* 📊 `lib/features/portfolio/models/project_model.dart` → Edit daftar proyek
* 🎨 `lib/core/theme/app_colors.dart` → Ubah skema warna *brand*

---

## 📜 Lisensi

Proyek ini bersifat **Internal / Personal**. Lisensi publik belum ditentukan.

---

## ℹ️ Informasi Tambahan

Aplikasi ini dibangun dengan fokus utama pada **presensi digital** dan **personal branding**. Menggunakan arsitektur yang modular, proyek ini sangat mudah dikembangkan, di-maintain, dan ditambah dengan fitur-fitur baru di masa depan! ✨

```

```
