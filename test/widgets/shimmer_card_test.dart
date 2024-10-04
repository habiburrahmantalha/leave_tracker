import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:leave_tracker/widgets/shimmer_absence_card.dart'; // Adjust the import as necessary

void main() {
  testWidgets('ShimmerCardView renders correctly', (WidgetTester tester) async {
    // Build the ShimmerCardView widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ShimmerCardView(),
        ),
      ),
    );

    // Verify that the shimmer card has a certain structure
    expect(find.byType(ShimmerCardView), findsOneWidget);

    // Verify that there are two dividers
    expect(find.byType(Divider), findsNWidgets(2));

  });

  testWidgets('ShimmerCardList renders correct number of cards', (WidgetTester tester) async {
    // Build the ShimmerCardList widget with a specific number of items
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ShimmerCardList(items: 3),
        ),
      ),
    );

    // Verify that the ShimmerCardList contains the correct number of shimmer cards
    expect(find.byType(ShimmerCardView), findsNWidgets(3)); // 3 shimmer cards
  });

  testWidgets('ShimmerCardList renders default number of cards', (WidgetTester tester) async {
    // Build the ShimmerCardList widget without specifying items
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ShimmerCardList(),
        ),
      ),
    );

    // Verify that the ShimmerCardList contains the default number of shimmer cards
    expect(find.byType(ShimmerCardView), findsNWidgets(4)); // Default is 5 shimmer cards
  });
}
