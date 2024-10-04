import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:leave_tracker/widgets/raw_button.dart';

void main() {
  testWidgets('RawButton should respond to taps', (WidgetTester tester) async {
    // Variables to track the button actions
    bool tapped = false;
    bool longPressed = false;

    // Build the RawButton widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RawButton(
            onTap: () {
              tapped = true;
            },
            onLongPress: () {
              longPressed = true;
            },
            child: const Text('Tap me'),
          ),
        ),
      ),
    );

    // Verify that the button has been built
    expect(find.text('Tap me'), findsOneWidget);

    // Simulate a tap on the button
    await tester.tap(find.byType(RawButton));
    await tester.pump(); // Allow time for the tap to register

    // Verify that the tap callback was triggered
    expect(tapped, isTrue);
    expect(longPressed, isFalse); // Ensure long press wasn't triggered

    // Simulate a long press on the button
    await tester.longPress(find.byType(RawButton));
    await tester.pump(); // Allow time for the long press to register

    // Verify that the long press callback was triggered
    expect(longPressed, isTrue);
  });
}
