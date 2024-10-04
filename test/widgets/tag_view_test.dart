// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:leave_tracker/main.dart';
import 'package:leave_tracker/widgets/tag_view.dart';

void main() {
  testWidgets('TagView displays child correctly', (WidgetTester tester) async {
    // Arrange
    final testWidget = TagView(
      child: const Text('Test Tag', style: TextStyle(color: Colors.white)),
      color: Colors.blue,
      textColor: Colors.white,
      radius: 8,
      padding: EdgeInsets.all(8),
      borderColor: Colors.black,
    );

    // Act
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(child: testWidget),
        ),
      ),
    );

    // Assert
    expect(find.text('Test Tag'), findsOneWidget);
    expect(tester.widget<Container>(find.byType(Container)).decoration, isA<BoxDecoration>());
    final boxDecoration = tester.widget<Container>(find.byType(Container)).decoration as BoxDecoration;

    // Check properties of the BoxDecoration
    expect(boxDecoration.color, Colors.blue);
    expect(boxDecoration.borderRadius, BorderRadius.circular(8));
    expect(boxDecoration.border, Border.all(color: Colors.black));
  });

  testWidgets('TagView uses default values if not provided', (WidgetTester tester) async {
    // Arrange
    final testWidget = TagView(
      child: const Text('Default Tag'),
    );

    // Act
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(child: testWidget),
        ),
      ),
    );

    // Assert
    expect(find.text('Default Tag'), findsOneWidget);
    final container = tester.widget<Container>(find.byType(Container));
    expect(container.padding, EdgeInsets.symmetric(horizontal: 4, vertical: 2));
  });
}
