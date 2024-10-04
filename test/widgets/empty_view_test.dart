import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:leave_tracker/widgets/empty_view.dart'; // Adjust the import as necessary

void main() {
  testWidgets('EmptyView displays title, description, image, and button', (WidgetTester tester) async {
    // Create a test title and description
    const testTitle = 'No Data Available';
    const testDescription = 'Please check back later.';

    // Create a button widget for the test
    final buttonWidget = ElevatedButton(
      onPressed: () {},
      child: const Text('Retry'),
    );

    // Build the EmptyView widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: EmptyView(
            title: testTitle,
            description: testDescription,
            image: const Icon(Icons.error), // Example image
            button: buttonWidget,
          ),
        ),
      ),
    );

    // Verify that the title is displayed
    expect(find.text(testTitle), findsOneWidget);

    // Verify that the description is displayed
    expect(find.text(testDescription), findsOneWidget);

    // Verify that the image (icon) is displayed
    expect(find.byIcon(Icons.error), findsOneWidget);

    // Verify that the button is displayed
    expect(find.text('Retry'), findsOneWidget);

    // Simulate tapping the button
    await tester.tap(find.text('Retry'));
    await tester.pumpAndSettle(); // Allow time for the tap to complete
  });
}
