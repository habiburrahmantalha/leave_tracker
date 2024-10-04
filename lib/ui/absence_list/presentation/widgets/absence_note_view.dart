import 'package:flutter/material.dart';
import 'package:leave_tracker/core/utils/extensions.dart';

/// A widget that displays an absence note with an associated label.
class AbsenceNoteView extends StatelessWidget {
  /// Creates an instance of [AbsenceNoteView].
  ///
  /// The [note] and [label] parameters are required.
  const AbsenceNoteView({
    super.key,
    required this.note,
    required this.label,
  });

  /// The content of the absence note.
  final String note;

  /// The label associated with the absence note.
  final String label;

  @override
  Widget build(final BuildContext context) {
    return Visibility(
        visible: note.isNotEmpty,
        child: Column(
          children: [
            const Divider(thickness: 0.3,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text.rich(
                    TextSpan(
                      text: label,
                      style: Theme.of(context).textTheme.labelLarge,
                      children: [
                        TextSpan(
                          text: note.capitalize(), style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
    );
  }
}