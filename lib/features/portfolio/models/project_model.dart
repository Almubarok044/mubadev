class ProjectModel {
  final String id;
  final String title;
  final String subtitle;
  final String category;
  final String shortDescription;
  final String fullDescription;
  final String
  thumbnailAsset; // <-- TAMBAHKAN INI (Khusus Thumbnail Mockup di Halaman Awal)
  final String imageAsset; // (Khusus Screenshot Asli di Halaman Detail)
  final String demoUrl;
  final List<String> technologies;
  final List<String> features;
  final String duration;
  final String teamRole;
  final String status;

  const ProjectModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.category,
    required this.shortDescription,
    required this.fullDescription,
    required this.thumbnailAsset, // <-- TAMBAHKAN DI CONSTRUCTOR
    required this.imageAsset,
    required this.demoUrl,
    required this.technologies,
    this.features = const [],
    this.duration = '-',
    this.teamRole = '-',
    this.status = '-',
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
      subtitle: 'proj_hidroponik_subtitle',
      category: 'proj_cat_final',
      shortDescription: 'proj_hidroponik_short_desc',
      fullDescription: 'proj_hidroponik_full_desc',
      thumbnailAsset: 'assets/images/hidroponik.png',
      imageAsset: 'assets/images/hidroponik.png',
      demoUrl: 'https://skripsihidroponik-with-iot.web.app/',
      technologies: ['Flutter', 'IoT', 'Firebase', 'ESP32 / Sensors', 'Dart'],
      features: [
        'proj_hidroponik_feat_1',
        'proj_hidroponik_feat_2',
        'proj_hidroponik_feat_3',
      ],
    ),
    ProjectModel(
      id: 'invoice-sales-system',
      title: 'Invoice-Based Sales System',
      subtitle: 'proj_invoice_subtitle',
      category: 'proj_cat_internship',
      shortDescription: 'proj_invoice_short_desc',
      fullDescription: 'proj_invoice_full_desc',
      thumbnailAsset: 'assets/images/invoice.png',
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
        'proj_invoice_feat_1',
        'proj_invoice_feat_2',
        'proj_invoice_feat_3',
      ],
    ),
    ProjectModel(
      id: 'welding-workshop',
      title: 'Welding Workshop',
      subtitle: 'proj_welding_subtitle',
      category: 'proj_cat_freelance',
      shortDescription: 'proj_welding_short_desc',
      fullDescription: 'proj_welding_full_desc',
      thumbnailAsset: 'assets/mockup/weldingmockup.png',
      imageAsset: 'assets/images/welding.png',
      demoUrl: 'https://bengkellas999.netlify.app/',
      technologies: [
        'Flutter Web',
        'Responsive UI',
        'WhatsApp API',
        'Google Maps',
      ],
      features: [
        'proj_welding_feat_1',
        'proj_welding_feat_2',
        'proj_welding_feat_3',
      ],
    ),
    ProjectModel(
      id: 'ice-mambo-lasmi',
      title: 'Ice Mambo Lasmi',
      subtitle: 'proj_icemambo_subtitle',
      category: 'proj_cat_freelance',
      shortDescription: 'proj_icemambo_short_desc',
      fullDescription: 'proj_icemambo_full_desc',
      thumbnailAsset: 'assets/mockup/icemambomockup.png',
      imageAsset: 'assets/images/icemambo.png',
      demoUrl: 'https://es-mambo-lasmi.web.app/',
      technologies: [
        'Flutter',
        'Responsive UI',
        'Digital Catalog',
        'UI/UX Design',
      ],
      features: [
        'proj_icemambo_feat_1',
        'proj_icemambo_feat_2',
        'proj_icemambo_feat_3',
      ],
    ),
  ];
}
