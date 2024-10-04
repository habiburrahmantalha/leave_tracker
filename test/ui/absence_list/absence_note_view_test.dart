import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:leave_tracker/ui/absence_list/presentation/widgets/absence_note_view.dart';
import 'package:leave_tracker/core/utils/extensions.dart';

void main() {
  group('AbsenceNoteView', () {
    testWidgets('displays absence note and label when note is not empty', (WidgetTester tester) async {
      // Arrange
      const String note = 'This is a test note';
      const String label = 'Absence Reason: ';

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AbsenceNoteView(note: note, label: label),
          ),
        ),
      );

      // Assert
      expect(find.byType(Divider), findsOneWidget);
      expect(find.text('$label${note.capitalize()}'), findsOneWidget);

    });

    testWidgets('does not display anything when note is empty', (WidgetTester tester) async {
      // Arrange
      const String note = '';
      const String label = 'Absence Reason: ';

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AbsenceNoteView(note: note, label: label),
          ),
        ),
      );

      // Assert
      expect(find.byType(Divider), findsNothing);
      expect(find.text(label), findsNothing); // No text should be present since note is empty
    });
  });
}
