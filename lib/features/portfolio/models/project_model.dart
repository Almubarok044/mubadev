class ProjectModel {
  final String id;
  final String title;
  final String subtitle;
  final String category;
  final String shortDescription;
  final String fullDescription;
  final String imageAsset;
  final String demoUrl;
  final List<String> technologies;
  final List<String> features;

  const ProjectModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.category,
    required this.shortDescription,
    required this.fullDescription,
    required this.imageAsset,
    required this.demoUrl,
    required this.technologies,
    this.features = const [],
  });

  bool get hasValidDemoUrl {
    final uri = Uri.tryParse(demoUrl);
    return uri != null &&
        uri.hasScheme &&
        (uri.scheme == 'http' || uri.scheme == 'https') &&
        uri.host.isNotEmpty;
  }

  static const List<ProjectModel> projects = [
    ProjectModel(
      id: 'hidroponik-app',
      title: 'Hidroponik App',
      subtitle: 'Monitoring & Kontrol Sistem Hidroponik Modern',
      category: 'IoT-Enabled Multiplatform Web & Mobile App',
      shortDescription:
          'Solusi cerdas berbasis real-time untuk memantau dan mengendalikan sistem budidaya hidroponik dengan kontrol presisi.',
      fullDescription:
          'Hidroponik App adalah solusi cerdas untuk memantau dan mengendalikan sistem budidaya hidroponik Anda. Dengan teknologi real-time, aplikasi ini memudahkan petani modern untuk mengoptimalkan hasil panen dengan kontrol presisi terhadap kondisi lingkungan tanaman.',
      imageAsset: 'assets/images/hidroponik.png',
      demoUrl: 'https://skripsihidroponik-with-iot.web.app/',
      technologies: ['Flutter', 'IoT', 'Firebase', 'ESP32 / Sensors', 'Dart'],
      features: [
        'Monitoring kondisi air & nutrisi tanaman secara real-time',
        'Kontrol otomatisasi pompa & pencahayaan dari jarak jauh',
        'Notifikasi & analitik riwayat pertumbuhan tanaman',
      ],
    ),
    ProjectModel(
      id: 'invoice-sales-system',
      title: 'Invoice-Based Sales System',
      subtitle: 'Sistem Manajemen Penjualan & Faktur Digital',
      category: 'Multiplatform Web & Mobile App',
      shortDescription:
          'Aplikasi manajemen transaksi penjualan dengan pengelolaan pelanggan, inventaris barang, dan ekspor faktur PDF.',
      fullDescription:
          'Aplikasi ini adalah proyek Flutter untuk mengelola transaksi penjualan secara digital. Aplikasi ini mencakup fitur utama seperti manajemen pelanggan, pengelolaan barang, pembuatan faktur, serta ekspor dokumen faktur ke format PDF.',
      imageAsset: 'assets/images/invoice.png',
      demoUrl: 'https://penjualanberbasisfaktur.web.app/',
      technologies: [
        'Flutter',
        'Dart',
        'PDF Generation',
        'Database',
        'State Management',
      ],
      features: [
        'Manajemen data pelanggan dan riwayat transaksi',
        'Pengelolaan stok dan katalog barang secara akurat',
        'Pembuatan faktur otomatis dan cetak / ekspor ke format PDF',
      ],
    ),
    ProjectModel(
      id: 'welding-workshop',
      title: 'Welding Workshop',
      subtitle: 'Landing Page Profil Bisnis & Portofolio Bengkel Las 999',
      category: 'Web / Landing Page',
      shortDescription:
          'Single Page Application profil bisnis Bengkel Las 999 Cibinong yang dioptimalkan untuk konversi dengan WhatsApp & Maps.',
      fullDescription:
          'Website ini merupakan landing page profil bisnis dan portofolio untuk Bengkel Las 999 yang berlokasi di Cibinong, Kabupaten Bogor. Website ini dirancang sebagai platform company profile satu halaman (Single Page Application/Landing Page) yang dioptimalkan untuk konversi prospek melalui fitur panggilan darurat, integrasi WhatsApp, dan penunjuk arah Google Maps.',
      imageAsset: 'assets/images/welding.png',
      demoUrl: 'https://bengkellas999.netlify.app/',
      technologies: [
        'Flutter Web',
        'Responsive UI',
        'WhatsApp API',
        'Google Maps',
      ],
      features: [
        'Desain Single Page Application yang interaktif & responsif',
        'Integrasi tombol darurat dan WhatsApp untuk konversi cepat',
        'Penunjuk arah interaktif langsung ke lokasi via Google Maps',
      ],
    ),
    ProjectModel(
      id: 'ice-mambo-lasmi',
      title: 'Ice Mambo Lasmi',
      subtitle: 'Katalog Produk Digital Es Mambo, Jelly & Kue Kering',
      category: 'Product Catalog (Mobile & Web)',
      shortDescription:
          'Aplikasi katalog produk digital modern untuk brand Es Mambo Lasmi, menampilkan lini produk segar dan hampers premium.',
      fullDescription:
          'Aplikasi katalog produk digital untuk brand Es Mambo Lasmi, dibuat dengan Flutter. Aplikasi ini menampilkan produk utama seperti Es Mambo, Es Jelly, dan berbagai pilihan kue kering serta hampers premium dengan desain modern yang responsif untuk desktop dan mobile.',
      imageAsset: 'assets/images/icemambo.png',
      demoUrl: 'https://es-mambo-lasmi.web.app/',
      technologies: [
        'Flutter',
        'Responsive UI',
        'Digital Catalog',
        'UI/UX Design',
      ],
      features: [
        'Katalog visual produk Es Mambo, Es Jelly, dan aneka kue kering',
        'Kategori khusus paket hampers premium dan bingkisan hari raya',
        'Tampilan responsif dan mulus untuk desktop, tablet, dan smartphone',
      ],
    ),
  ];
}
