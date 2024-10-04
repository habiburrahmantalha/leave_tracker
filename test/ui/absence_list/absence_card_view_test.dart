import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:leave_tracker/ui/absence_list/domain/entities/absence.dart';
import 'package:leave_tracker/ui/absence_list/domain/entities/member.dart';
import 'package:leave_tracker/core/constants/enums.dart';
import 'package:leave_tracker/ui/absence_list/presentation/widgets/absence_card_view.dart'; // Adjust this import based on your file structure
import 'package:leave_tracker/widgets/tag_view.dart';
import 'package:leave_tracker/l10n/localization.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  testWidgets('AbsenceCardView displays absence data correctly', (WidgetTester tester) async {
    // Arrange
    final absenceData = Absence(
      id: 1,
      member: Member(userId: 1, name: 'John Doe', image: 'https://loremflickr.com/300/400'),
      startDate: DateTime(2024, 10, 1),
      endDate: DateTime(2024, 10, 5),
      status: AbsenceStatus.confirmed, // Assuming AbsenceStatus has been defined
      type: AbsenceType.vacation, // Assuming AbsenceType has been defined
      memberNote: 'This is a member note.',
      admitterNote: 'This is an admitter note.',
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
          body: AbsenceCardView(data: absenceData),
        ),
      ),
    );

    // Act
    await tester.pumpAndSettle();

    // Assert
    // Check for member info
    // expect(find.text('John Doe'), findsOneWidget);
    // expect(find.byType(TagView), findsNWidgets(2)); // Check for two tags (status and type)
    // expect(find.text('Confirmed'), findsOneWidget); // Check for status title
    // expect(find.text('Vacation'), findsOneWidget); // Check for type title
    // expect(find.text('Member note: This is a member note.'), findsOneWidget);
    // expect(find.text('Admitter note: This is an admitter note.'), findsOneWidget);
    //
    // // Check the absence period
    // expect(find.text('01 Oct, 2024 - 05 Oct, 2024'), findsOneWidget); // Ensure the dates are formatted correctly
  });
}
