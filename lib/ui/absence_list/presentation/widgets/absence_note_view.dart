import 'package:flutter/material.dart';
import 'package:leave_tracker/core/utils/extensions.dart';

class AbsenceNoteView extends StatelessWidget {
  const AbsenceNoteView({
    super.key,
    required this.note, required this.label,});

  final String note;
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