import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mubadev/features/portfolio/models/project_model.dart';
import 'package:mubadev/features/portfolio/screens/project_detail_screen.dart';

// Import file ProjectDetailScreen dan model Project kamu di sini
// import 'package:nama_project/screens/project_detail_screen.dart';

void main() {
  testWidgets('Test tampilan ProjectDetailScreen', (WidgetTester tester) async {
    // 1. Siapkan data dummy untuk variabel 'project'
    // Sesuaikan propertinya dengan model class Project milikmu
    final project = ProjectModel.projects.first;

    // 2. KODE KAMU DITARUH DI SINI
    await tester.pumpWidget(
      MaterialApp(home: ProjectDetailScreen(project: project)),
    );
    await tester.pumpAndSettle();

    // 3. Verifikasi UI menggunakan expect() di bawahnya
    // expect(find.text('Project Hidroponik'), findsOneWidget);
  });
}
