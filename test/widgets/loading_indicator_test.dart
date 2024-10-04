import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:leave_tracker/widgets/loading_indicator.dart'; // Adjust the import as necessary

void main() {
  testWidgets('LoadingIndicator renders correctly with default size', (WidgetTester tester) async {
    // Build the LoadingIndicator widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: LoadingIndicator(),
        ),
      ),
    );

    // Verify that the LoadingIndicator is found in the widget tree
    expect(find.byType(LoadingIndicator), findsOneWidget);

    // Verify that the CircularProgressIndicator is rendered
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // Verify that the CircularProgressIndicator has the correct size
    final progressIndicator = tester.widget<CircularProgressIndicator>(find.byType(CircularProgressIndicator));
    expect(progressIndicator.strokeWidth, 3.0);
  });

  testWidgets('LoadingIndicator renders correctly with custom size', (WidgetTester tester) async {
    // Build the LoadingIndicator widget with a custom size
    const double customSize = 48.0;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: LoadingIndicator(size: customSize),
        ),
      ),
    );

    // Verify that the LoadingIndicator is found in the widget tree
    expect(find.byType(LoadingIndicator), findsOneWidget);

    // Verify that the CircularProgressIndicator is rendered
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // Verify that the LoadingIndicator has the custom size
    final loadingIndicatorFinder = find.byType(LoadingIndicator);
    final loadingIndicator = tester.widget<LoadingIndicator>(loadingIndicatorFinder);

    // Check the size of the LoadingIndicator
    final sizedBox = tester.widget<SizedBox>(find.descendant(
      of: loadingIndicatorFinder,
      matching: find.byType(SizedBox),
    ));
    expect(sizedBox.height, customSize);
    expect(sizedBox.width, customSize);
  });
}
