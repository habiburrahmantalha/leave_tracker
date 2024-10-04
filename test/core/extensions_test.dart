import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:leave_tracker/core/constants/enums.dart';
import 'package:leave_tracker/core/resource/theme.dart';
import 'package:leave_tracker/core/utils/extensions.dart'; // Adjust the import based on your file structure

void main() {
  group('StringExtension', () {
    test('capitalize should return capitalized string', () {
      expect('hello'.capitalize(), 'Hello');
      expect('hElLo'.capitalize(), 'HElLo');
      expect(''.capitalize(), '');
      expect('A'.capitalize(), 'A');
    });
  });

  group('DarkMode', () {
    testWidgets('isDarkMode should return true when in dark mode', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.dark(),
          home: Builder(
            builder: (context) {
              // Act & Assert
              expect(context.isDarkMode, false);
              return Container();
            },
          ),
        ),
      );
    });

    testWidgets('isDarkMode should return false when in light mode', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Builder(
            builder: (context) {
              // Act & Assert
              expect(context.isDarkMode, false);
              return Container();
            },
          ),
        ),
      );
    });
  });

  group('DateTimeExtension', () {
    test('toddMMMyy should format date correctly', () {
      final date = DateTime(2024, 10, 5);
      expect(date.toddMMMyy(), '05 Oct, 2024');
    });

    test('toddMMMyy should return empty string for null', () {
      expect((null as DateTime?).toddMMMyy(), '');
    });
  });

  group('AbsenceTypeExtension', () {
    testWidgets('should return correct color for AbsenceType', (WidgetTester tester) async {
      final mockThemeData = ThemeData.light().copyWith(
        extensions: <CustomStatusColors>{
          CustomStatusColors(
            vacationColor: Colors.green,
            sicknessColor: Colors.red,
            confirmedColor: Colors.blue,
            rejectedColor: Colors.orange,
            requestedColor: Colors.purple,
          ),
        },
      );

      await tester.pumpWidget(
        MaterialApp(
          theme: mockThemeData,
          home: Builder(
            builder: (context) {
              expect(AbsenceType.vacation.color(context), Colors.green);
              expect(AbsenceType.sickness.color(context), Colors.red);
              return Container();
            },
          ),
        ),
      );
    });
  });

  group('AbsenceStatusExtension', () {
    testWidgets('should return correct color for AbsenceStatus', (WidgetTester tester) async {
      final mockThemeData = ThemeData.light().copyWith(
        extensions: <CustomStatusColors>{
          CustomStatusColors(
            vacationColor: Colors.green,
            sicknessColor: Colors.red,
            confirmedColor: Colors.blue,
            rejectedColor: Colors.orange,
            requestedColor: Colors.purple,
          ),
        },
      );

      await tester.pumpWidget(
        MaterialApp(
          theme: mockThemeData,
          home: Builder(
            builder: (context) {
              expect(AbsenceStatus.confirmed.color(context), Colors.blue);
              expect(AbsenceStatus.rejected.color(context), Colors.orange);
              expect(AbsenceStatus.requested.color(context), Colors.purple);
              return Container();
            },
          ),
        ),
      );
    });
  });
}
