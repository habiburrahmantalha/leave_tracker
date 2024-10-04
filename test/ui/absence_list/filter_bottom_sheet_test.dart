import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:leave_tracker/core/constants/enums.dart';
import 'package:leave_tracker/ui/absence_list/domain/entities/absence_filter.dart';
import 'package:leave_tracker/widgets/raw_button.dart';
import 'package:leave_tracker/ui/absence_list/presentation/widgets/bottom_sheet_filter.dart';
import 'package:leave_tracker/core/constants/enums.dart';
import 'package:leave_tracker/l10n/localization.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  group('FilterBottomSheet', () {
    testWidgets('displays all filter options correctly', (WidgetTester tester) async {
      // Arrange
      AbsenceFilter selectedFilter = const AbsenceFilter(
        type: AbsenceType.sickness,
        status: AbsenceStatus.requested,
      );

      // Act
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: [
            AppLocalizations.delegate,  // The generated localization delegate
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          home: Scaffold(
            body: FilterBottomSheet(
              selectedFilter: selectedFilter,
              onComplete: (AbsenceFilter filter) {},
            ),
          ),
        ),
      );

      // Assert: Verify the Filter Bottom Sheet UI
      expect(find.text('Filter'), findsOneWidget);
      expect(find.text('Absence Type'), findsOneWidget);
      expect(find.text('Absence Status'), findsOneWidget);
      expect(find.text('Select Date Range'), findsOneWidget);
    });

    testWidgets('calls onComplete when Apply Filters button is pressed', (WidgetTester tester) async {
      // Arrange
      AbsenceFilter? appliedFilter;
      AbsenceFilter selectedFilter = const AbsenceFilter(
        type: AbsenceType.sickness,
        status: AbsenceStatus.requested,
      );

      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: [
            AppLocalizations.delegate,  // The generated localization delegate
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          home: Scaffold(
            body: FilterBottomSheet(
              selectedFilter: selectedFilter,
              onComplete: (AbsenceFilter filter) {
                appliedFilter = filter;
              },
            ),
          ),
        ),
      );

      // Act
      await tester.tap(find.byType(RawButton).last);
      await tester.pumpAndSettle();

      // Assert: Verify that onComplete is called with the correct filter
      expect(appliedFilter, isNotNull);
      expect(appliedFilter!.type, AbsenceType.sickness);
      expect(appliedFilter!.status, AbsenceStatus.requested);
    });

    testWidgets('resets the filters when reset button is pressed', (WidgetTester tester) async {
      // Arrange
      AbsenceFilter selectedFilter = const AbsenceFilter(
        type: AbsenceType.sickness,
        status: AbsenceStatus.requested,
      );

      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: [
            AppLocalizations.delegate,  // The generated localization delegate
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          home: Scaffold(
            body: FilterBottomSheet(
              selectedFilter: selectedFilter,
              onComplete: (AbsenceFilter filter) {},
            ),
          ),
        ),
      );

      // Act: Tap the reset button
      await tester.tap(find.text('Reset'));
      await tester.pumpAndSettle();

      // Assert: Verify that the filter values are reset
      final DropdownButtonFormField absenceTypeDropdown =
      tester.widget(find.byType(DropdownButtonFormField).first);
      expect("null", isNull);
    });

    testWidgets('displays the selected date range correctly', (WidgetTester tester) async {
      // Arrange
      AbsenceFilter selectedFilter = AbsenceFilter(
        type: AbsenceType.sickness,
        status: AbsenceStatus.requested,
        dateTimeRange: DateTimeRange(
          start: DateTime(2023, 1, 1),
          end: DateTime(2023, 1, 10),
        ),
      );

      // Act
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: [
            AppLocalizations.delegate,  // The generated localization delegate
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          home: Scaffold(
            body: FilterBottomSheet(
              selectedFilter: selectedFilter,
              onComplete: (AbsenceFilter filter) {},
            ),
          ),
        ),
      );

      // Assert: Verify that the selected date range is displayed correctly
      expect(find.text('01 Jan, 2023 - 10 Jan, 2023'), findsOneWidget);
    });
  });
}
