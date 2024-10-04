import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:leave_tracker/widgets/filter_item_button.dart'; // Adjust the import as necessary

void main() {
  testWidgets('FilterItemButton displays label and triggers onClear callback', (WidgetTester tester) async {
    // Define a key for the button to find it later
    const buttonKey = Key('filter_item_button');

    // Define a variable to track the onClear callback
    var isClearCalled = false;

    // Build the FilterItemButton widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: FilterItemButton(
            key: buttonKey,
            label: 'Test Filter',
            onClear: () {
              isClearCalled = true;
            },
          ),
        ),
      ),
    );

    // Verify that the label is displayed correctly
    expect(find.text('Test Filter'), findsOneWidget);

    // Find the close icon button
    final closeButton = find.byIcon(Icons.close);
    expect(closeButton, findsOneWidget);

    // Simulate a tap on the close button
    await tester.tap(closeButton);
    await tester.pumpAndSettle(); // Allow time for the tap to complete

    // Verify that the onClear callback was called
    expect(isClearCalled, true);
  });
}
