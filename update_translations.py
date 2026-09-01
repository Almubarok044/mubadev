import json

new_id = {
  "detail_project_overview": "Ringkasan Proyek",
  "detail_key_features": "Fitur Utama",
  "detail_technologies": "Teknologi",
  "detail_information": "Informasi",
  "detail_duration": "Durasi",
  "detail_team_role": "Tim & Peran",
  "detail_status": "Status",
  "detail_live_demo": "Live Demo",
  "country_indonesia": "Indonesia",
  
  "proj_cat_final": "Final Project",
  "proj_cat_internship": "Internship Project",
  "proj_cat_freelance": "Freelance Project",

  "proj_hidroponik_subtitle": "Monitoring & Kontrol Sistem Hidroponik Modern",
  "proj_hidroponik_short_desc": "Solusi cerdas berbasis real-time untuk memantau dan mengendalikan sistem budidaya hidroponik dengan kontrol presisi.",
  "proj_hidroponik_full_desc": "Hidroponik App adalah solusi cerdas untuk memantau dan mengendalikan sistem budidaya hidroponik Anda. Dengan teknologi real-time, aplikasi ini memudahkan petani modern untuk mengoptimalkan hasil panen dengan kontrol presisi terhadap kondisi lingkungan tanaman.",
  "proj_hidroponik_feat_1": "Monitoring kondisi air & nutrisi tanaman secara real-time",
  "proj_hidroponik_feat_2": "Kontrol otomatisasi pompa & pencahayaan dari jarak jauh",
  "proj_hidroponik_feat_3": "Notifikasi & analitik riwayat pertumbuhan tanaman",

  "proj_invoice_subtitle": "Sistem Manajemen Penjualan & Faktur Digital",
  "proj_invoice_short_desc": "Aplikasi manajemen transaksi penjualan dengan pengelolaan pelanggan, inventaris barang, dan ekspor faktur PDF.",
  "proj_invoice_full_desc": "Aplikasi ini adalah proyek Flutter untuk mengelola transaksi penjualan secara digital. Aplikasi ini mencakup fitur utama seperti manajemen pelanggan, pengelolaan barang, pembuatan faktur, serta ekspor dokumen faktur ke format PDF.",
  "proj_invoice_feat_1": "Manajemen data pelanggan dan riwayat transaksi",
  "proj_invoice_feat_2": "Pengelolaan stok dan katalog barang secara akurat",
  "proj_invoice_feat_3": "Pembuatan faktur otomatis dan cetak / ekspor ke format PDF",

  "proj_welding_subtitle": "Landing Page Profil Bisnis & Portofolio Bengkel Las 999",
  "proj_welding_short_desc": "Single Page Application profil bisnis Bengkel Las 999 Cibinong yang dioptimalkan untuk konversi dengan WhatsApp & Maps.",
  "proj_welding_full_desc": "Website ini merupakan landing page profil bisnis dan portofolio untuk Bengkel Las 999 yang berlokasi di Cibinong, Kabupaten Bogor. Website ini dirancang sebagai platform company profile satu halaman (Single Page Application/Landing Page) yang dioptimalkan untuk konversi prospek melalui fitur panggilan darurat, integrasi WhatsApp, dan penunjuk arah Google Maps.",
  "proj_welding_feat_1": "Desain Single Page Application yang interaktif & responsif",
  "proj_welding_feat_2": "Integrasi tombol darurat dan WhatsApp untuk konversi cepat",
  "proj_welding_feat_3": "Penunjuk arah interaktif langsung ke lokasi via Google Maps",

  "proj_icemambo_subtitle": "Katalog Produk Digital Es Mambo, Jelly & Kue Kering",
  "proj_icemambo_short_desc": "Aplikasi katalog produk digital modern untuk brand Es Mambo Lasmi, menampilkan lini produk segar dan hampers premium.",
  "proj_icemambo_full_desc": "Aplikasi katalog produk digital untuk brand Es Mambo Lasmi, dibuat dengan Flutter. Aplikasi ini menampilkan produk utama seperti Es Mambo, Es Jelly, dan berbagai pilihan kue kering serta hampers premium dengan desain modern yang responsif untuk desktop dan mobile.",
  "proj_icemambo_feat_1": "Katalog visual produk Es Mambo, Es Jelly, dan aneka kue kering",
  "proj_icemambo_feat_2": "Kategori khusus paket hampers premium dan bingkisan hari raya",
  "proj_icemambo_feat_3": "Tampilan responsif dan mulus untuk desktop, tablet, dan smartphone"
}

new_en = {
  "detail_project_overview": "Project Overview",
  "detail_key_features": "Key Features",
  "detail_technologies": "Technologies",
  "detail_information": "Information",
  "detail_duration": "Duration",
  "detail_team_role": "Team & Role",
  "detail_status": "Status",
  "detail_live_demo": "Live Demo",
  "country_indonesia": "Indonesia",
  
  "proj_cat_final": "Final Project",
  "proj_cat_internship": "Internship Project",
  "proj_cat_freelance": "Freelance Project",

  "proj_hidroponik_subtitle": "Modern Hydroponic System Monitoring & Control",
  "proj_hidroponik_short_desc": "Smart real-time solution to monitor and control hydroponic cultivation systems with precise control.",
  "proj_hidroponik_full_desc": "Hydroponic App is a smart solution to monitor and control your hydroponic cultivation system. With real-time technology, this application makes it easier for modern farmers to optimize crop yields with precise control over plant environmental conditions.",
  "proj_hidroponik_feat_1": "Real-time monitoring of water conditions & plant nutrients",
  "proj_hidroponik_feat_2": "Automated remote control of pumps & lighting",
  "proj_hidroponik_feat_3": "Notifications & analytics of plant growth history",

  "proj_invoice_subtitle": "Digital Invoice & Sales Management System",
  "proj_invoice_short_desc": "Sales transaction management application with customer management, inventory, and PDF invoice export.",
  "proj_invoice_full_desc": "This application is a Flutter project for managing sales transactions digitally. It includes key features such as customer management, inventory management, invoice generation, and exporting invoice documents to PDF format.",
  "proj_invoice_feat_1": "Customer data and transaction history management",
  "proj_invoice_feat_2": "Accurate inventory and product catalog management",
  "proj_invoice_feat_3": "Automatic invoice generation and PDF export/print",

  "proj_welding_subtitle": "Bengkel Las 999 Business Profile & Portfolio Landing Page",
  "proj_welding_short_desc": "Single Page Application business profile for Bengkel Las 999 Cibinong optimized for conversion with WhatsApp & Maps integration.",
  "proj_welding_full_desc": "This website is a business profile and portfolio landing page for Bengkel Las 999 located in Cibinong, Bogor Regency. The website is designed as a single-page company profile platform (Single Page Application/Landing Page) optimized for lead conversion through emergency call features, WhatsApp integration, and Google Maps directions.",
  "proj_welding_feat_1": "Interactive & responsive Single Page Application design",
  "proj_welding_feat_2": "Emergency button and WhatsApp integration for quick conversion",
  "proj_welding_feat_3": "Interactive direct directions to location via Google Maps",

  "proj_icemambo_subtitle": "Ice Mambo, Jelly & Pastries Digital Product Catalog",
  "proj_icemambo_short_desc": "Modern digital product catalog app for the Ice Mambo Lasmi brand, showcasing fresh product lines and premium hampers.",
  "proj_icemambo_full_desc": "A digital product catalog application for the Ice Mambo Lasmi brand, built with Flutter. This application showcases main products such as Ice Mambo, Ice Jelly, and various pastry selections as well as premium hampers with a modern responsive design for desktop and mobile.",
  "proj_icemambo_feat_1": "Attractive & modern visual product catalog interface",
  "proj_icemambo_feat_2": "Special category for premium hampers and holiday gifts",
  "proj_icemambo_feat_3": "Responsive and seamless layout for desktop, tablet, and smartphone"
}

for file_path, updates in [("assets/translations/id.json", new_id), ("assets/translations/en.json", new_en)]:
    with open(file_path, "r") as f:
        data = json.load(f)
    data.update(updates)
    with open(file_path, "w") as f:
        json.dump(data, f, indent=2)

print("Translations updated successfully.")
