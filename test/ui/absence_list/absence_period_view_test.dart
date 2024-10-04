import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:leave_tracker/ui/absence_list/presentation/widgets/absence_period_view.dart'; // Adjust the import based on your file structure
import 'package:leave_tracker/generated/assets.dart';

void main() {
  group('AbsencePeriodView', () {
    testWidgets('displays single date when start and end are the same', (WidgetTester tester) async {
      // Arrange
      final DateTime date = DateTime(2024, 10, 5); // Example date

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AbsencePeriodView(start: date, end: date),
          ),
        ),
      );

      // Assert
      expect(find.byType(Image), findsOneWidget);
      expect(find.text('05 Oct, 2024'), findsOneWidget);
    });

    testWidgets('displays date range when start and end are different', (WidgetTester tester) async {
      // Arrange
      final DateTime startDate = DateTime(2024, 10, 5);
      final DateTime endDate = DateTime(2024, 10, 10);

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AbsencePeriodView(start: startDate, end: endDate),
          ),
        ),
      );

      // Assert
      expect(find.byType(Image), findsOneWidget);
      expect(find.text('05 Oct, 2024 - 10 Oct, 2024'), findsOneWidget);
    });

    testWidgets('does not display anything when start is null', (WidgetTester tester) async {
      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AbsencePeriodView(start: null, end: DateTime(2024, 10, 10)),
          ),
        ),
      );

      // Assert
      expect(find.byType(Image), findsNothing);
      expect(find.text(''), findsNothing); // No text should be present
    });

    testWidgets('does not display anything when both start and end are null', (WidgetTester tester) async {
      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AbsencePeriodView(start: null, end: null),
          ),
        ),
      );

      // Assert
      expect(find.byType(Image), findsNothing);
      expect(find.text(''), findsNothing); // No text should be present
    });
  });
}
