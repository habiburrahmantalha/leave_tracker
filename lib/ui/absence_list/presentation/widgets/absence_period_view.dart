import 'package:flutter/material.dart';
import 'package:leave_tracker/core/utils/extensions.dart';
import 'package:leave_tracker/generated/assets.dart';
import 'package:leave_tracker/widgets/raw_button.dart';

/// A widget that displays the absence period with start and end dates.
class AbsencePeriodView extends StatelessWidget {
  /// Creates an instance of [AbsencePeriodView].
  ///
  /// The [start] and [end] parameters are optional and can be null.
  const AbsencePeriodView({
    super.key,
    this.start,
    this.end,
    required this.onTap,
  });

  /// The start date of the absence period.
  final DateTime? start;

  /// The end date of the absence period.
  final DateTime? end;

  /// callback onTap
  final Function onTap;

  @override
  Widget build(final BuildContext context) {
    return Visibility(
      visible: start != null,
      child: RawButton(
        margin: const EdgeInsets.only(top: 8),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        onTap: ()=> onTap(),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(Assets.imagesCalendar, height: 18, color: context.isDarkMode ? Colors.blue.shade300 : Colors.blue.shade600),
            const SizedBox(width: 8),
            start == end ?
            Text(start?.toddMMMyy() ?? '', style: Theme.of(context).textTheme.bodyMedium,) :
            Text('${start?.toddMMMyy() ?? ''} - ${end?.toddMMMyy() ?? ''}', style: Theme.of(context).textTheme.bodyMedium,),
            const SizedBox(width: 8),
            Image.asset(Assets.imagesDownloads, height: 14, color: Theme.of(context).iconTheme.color,),
          ],
        ),
      ),
    );
  }
}