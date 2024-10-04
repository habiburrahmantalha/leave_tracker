import 'package:flutter/material.dart';
import 'package:leave_tracker/core/utils/extensions.dart';
import 'package:leave_tracker/generated/assets.dart';

class AbsencePeriodView extends StatelessWidget {
  const AbsencePeriodView({
    super.key, this.start, this.end,

  });

  final DateTime? start;
  final DateTime? end;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: start != null,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Image.asset(Assets.imagesCalendar, height: 18, color: context.isDarkMode ? Colors.blue.shade300 : Colors.blue.shade600),
            SizedBox(width: 8),
            start == end ?
            Text(start?.toddMMMyy() ?? "", style: Theme.of(context).textTheme.bodyMedium,) :
            Text("${start?.toddMMMyy() ?? ""} - ${end?.toddMMMyy() ?? ""}", style: Theme.of(context).textTheme.bodyMedium,),
          ],
        ),
      ),
    );
  }
}