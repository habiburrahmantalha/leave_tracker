import 'package:flutter/material.dart';

/// A widget that displays an absence note with an associated label.
class AbsenceInfoView extends StatelessWidget {
  /// Creates an instance of [AbsenceInfoView].
  ///
  /// The [value] and [label] parameters are required.
  const AbsenceInfoView({
    super.key,
    required this.value,
    required this.label,
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
  });

  /// The content of the absence note.
  final Widget value;

  /// The label associated with the absence note.
  final String label;

  /// MainAxisAlignment of the row
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(final BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Text(label, style: Theme.of(context).textTheme.labelLarge),
        value,
      ],
    );
  }
}