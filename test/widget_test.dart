// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mubadev/features/portfolio/models/project_model.dart';
import 'package:mubadev/features/portfolio/screens/project_detail_screen.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('each project has a valid live demo URL', () {
    for (final project in ProjectModel.projects) {
      expect(project.demoUrl, isNotEmpty);

      final uri = Uri.tryParse(project.demoUrl);
      expect(uri, isNotNull);
      expect(uri!.hasScheme, isTrue);
      expect(uri.scheme, anyOf('http', 'https'));
      expect(uri.host, isNotEmpty);
    }
  });

  testWidgets('project detail screen shows live demo button', (tester) async {
    final project = ProjectModel.projects.first;

    tester.view.physicalSize = const Size(1440, 1200);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() => tester.view.resetPhysicalSize());
    addTearDown(() => tester.view.resetDevicePixelRatio());

    await tester.pumpWidget(
      MaterialApp(home: ProjectDetailScreen(project: project)),
    );

    await tester.pumpAndSettle();

    expect(find.text('detail_live_demo'), findsOneWidget);
  });
}
