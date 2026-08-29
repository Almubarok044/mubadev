<<<<<<< HEAD
# mubadev
Portfolio website dan aplikasi personal berbasis Flutter yang menampilkan profil, proyek, keahlian, pengalaman, serta kontak. Aplikasi ini dirancang sebagai landing page personal yang responsif dan multi-platform, dengan dukungan tema gelap/terang serta lokalisasi Bahasa Indonesia dan Inggris.
=======
# Mubadev

Portfolio website dan aplikasi personal berbasis Flutter yang menampilkan profil, proyek, keahlian, pengalaman, serta kontak. Aplikasi ini dirancang sebagai landing page personal yang responsif dan multi-platform, dengan dukungan tema gelap/terang serta lokalisasi Bahasa Indonesia dan Inggris.

## Ringkasan Proyek

Proyek ini dibuat untuk menampilkan identitas dan karya dari Mohamad Almubarok sebagai pengembang aplikasi dan software engineer. UI utamanya terdiri dari:

- halaman beranda / hero section
- halaman tentang saya
- halaman keahlian
- halaman proyek / portofolio
- halaman detail proyek
- halaman kontak

Aplikasi ini dapat dijalankan di berbagai platform Flutter seperti Android, iOS, Web, Linux, macOS, dan Windows.

## Teknologi yang Digunakan

- Flutter
- Dart
- Material 3
- easy_localization
- flutter_svg
- url_launcher
- font_awesome_flutter

## Struktur Folder

```text
mubadev/
├── android/
├── ios/
├── linux/
├── macos/
├── windows/
├── web/
├── assets/
│   ├── icon/
│   ├── images/
│   └── translations/
├── lib/
│   ├── core/
│   │   ├── constants/
│   │   ├── theme/
│   │   └── widgets/
│   ├── features/
│   │   ├── about/
│   │   ├── contact/
│   │   ├── home/
│   │   └── portfolio/
│   ├── main.dart
├── analysis_options.yaml
├── pubspec.yaml
├── README.md
└── test/
```

## Arsitektur Aplikasi

### 1. Entry Point
Aplikasi dimulai dari `lib/main.dart`. Pada file ini:

- inisialisasi `EasyLocalization`
- menetapkan locale default dan locale yang didukung
- menyiapkan `ThemeManager`
- mengatur route generator untuk navigasi antar halaman
- menambahkan `InteractiveCursor` sebagai wrapping global untuk efek kursor interaktif

### 2. Theme dan Styling
Folder `lib/core/theme/` berisi konfigurasi tampilan aplikasi:

- `app_colors.dart`: definisi warna utama, gradient, dan helper warna berdasarkan tema
- `theme_manager.dart`: pengelola mode gelap/terang dengan `ValueNotifier<ThemeMode>`

### 3. Layout Umum
Folder `lib/core/widgets/` berisi komponen reusable:

- `page_layout.dart`: layout utama dengan navbar, latar belakang grid, dan footer
- `custom_navbar.dart`: navigasi utama serta tombol toggle tema dan bahasa
- `custom_footer.dart`: footer dengan tautan sosial
- `interactive_cursor.dart`: efek kursor custom dan region yang menyembunyikan kursor
- `responsive_layout.dart`: helper layout responsif
- `infinite_marquee.dart`: komponen marquee untuk tampilan keahlian

### 4. Feature-based Structure
Setiap fitur dipisah berdasarkan domain:

- `features/home`: beranda / hero section dan project highlight
- `features/about`: halaman tentang, skills, dan experience
- `features/portfolio`: daftar proyek dan detail proyek
- `features/contact`: form kontak dan info kontak

## Fitur Utama

### Halaman Beranda
- hero text dengan nama dan tagline
- tombol navigasi ke proyek dan kontak
- project highlight card
- desain modern dengan efek hover dan kustom cursor

### Halaman Portofolio
- daftar proyek dalam bentuk grid
- navigasi menuju detail proyek
- informasi kategori, teknologi, dan deskripsi singkat

### Halaman Detail Proyek
- preview gambar proyek
- deskripsi latar belakang
- fitur utama
- teknologi yang dipakai

### Halaman Tentang
- profil singkat dan deskripsi diri
- layout responsif untuk mobile dan desktop

### Halaman Keahlian
- skill card dengan marquee animation
- menampilkan stack teknologi dan tools yang digunakan

### Halaman Kontak
- form pesan
- info kontak
- tombol social media

### Fitur Tambahan
- dark mode / light mode
- dukungan dua bahasa: Indonesia dan Inggris
- layout responsif untuk layar kecil dan besar
- efek hover dan animasi kecil untuk pengalaman UI yang lebih dinamis

## Routing

Aplikasi menggunakan `onGenerateRoute` di `lib/main.dart` dengan route berikut:

- `/` → `HomeScreen`
- `/work` → `PortfolioScreen`
- `/project_detail` → `ProjectDetailScreen`
- `/about` → `AboutScreen`
- `/skills` → `SkillsScreen`
- `/experience` → `ExperienceScreen`
- `/contact` → `ContactScreen`

## Data Proyek

Data proyek tersimpan dalam `lib/features/portfolio/models/project_model.dart`.

Saat ini terdapat beberapa proyek sampel, seperti:

- Hidroponik App
- Invoice-Based Sales System
- Welding Workshop
- Ice Mambo Lasmi

Setiap model berisi:

- id
- title
- subtitle
- category
- shortDescription
- fullDescription
- imageAsset
- technologies
- features

## Localization

File terjemahan berada di `assets/translations/`:

- `en.json`
- `id.json`

Aplikasi menggunakan `easy_localization` untuk mempermudah perubahan bahasa sesuai kebutuhan.

## Setup dan Menjalankan Aplikasi

### Prasyarat

Pastikan Flutter sudah terinstall di sistem Anda.

```bash
flutter --version
```

### Install Dependensi

```bash
flutter pub get
```

### Jalankan Aplikasi

```bash
flutter run
```

### Jalankan di Web

```bash
flutter run -d chrome
```

### Build Produksi

#### Web

```bash
flutter build web
```

#### Android

```bash
flutter build apk
```

## Catatan Penting

- Sebagian halaman masih merupakan prototype atau placeholder, misalnya halaman pengalaman (`ExperienceScreen`) yang belum diisi konten detail.
- Form kontak pada halaman kontak masih bersifat statis dan belum terhubung ke backend atau email service.
- Beberapa tombol sosial dan aksi navigasi sudah siap digunakan tetapi dapat disesuaikan nanti sesuai kebutuhan branding atau kebutuhan bisnis.

## Pengembangan Selanjutnya

Beberapa hal yang bisa ditambahkan di masa depan:

- backend untuk form kontak
- halaman pengalaman yang lebih lengkap dengan timeline kerja
- CMS atau data proyek dari API/JSON
- integrasi analytics
- optimasi SEO untuk versi web
- testing widget atau unit test

## Kontribusi

Proyek ini dapat dikembangkan lebih lanjut sesuai kebutuhan portfolio atau personal branding. Jika ingin menyesuaikan konten, lakukan perubahan di:

- `lib/features/...` untuk layar dan komponen
- `assets/translations/*.json` untuk teks dan label
- `lib/features/portfolio/models/project_model.dart` untuk daftar proyek
- `lib/core/theme/app_colors.dart` untuk warna brand

## Lisensi

Proyek ini bersifat internal / personal, dan belum ditentukan lisensi publik. Jika diperlukan, sesuaikan lisensi sesuai kebutuhan penggunaan.

## Informasi Tambahan

Aplikasi ini dibuat dengan pendekatan portfolio app yang fokus pada presensi digital dan personal branding. Struktur project sudah dibuat modular, sehingga mudah untuk dikembangkan menjadi versi yang lebih besar atau ditambahkan fitur baru.
>>>>>>> 324df6f (Add a new repo to github)
