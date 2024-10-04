import 'package:flutter/material.dart';
import 'package:leave_tracker/core/utils/extensions.dart';
import 'package:leave_tracker/l10n/localization.dart';
import 'package:leave_tracker/ui/absence_list/domain/entities/absence.dart';
import 'package:leave_tracker/widgets/raw_button.dart';
import 'package:leave_tracker/widgets/tag_view.dart';

import 'absence_note_view.dart';
import 'absence_period_view.dart';
import 'member_info_view.dart';

class AbsenceCardView extends StatelessWidget {
  const AbsenceCardView({super.key, required this.data});

  final Absence data;

  @override
  Widget build(final BuildContext context) {

    return RawButton(
      padding: const EdgeInsets.all(12),
      onTap: (){

      },
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MemberInfoView(image: data.member?.image ?? '', name: data.member?.name ?? '', key: Key(data.member?.userId?.toString() ?? ''),),
                    AbsencePeriodView(start: data.startDate, end: data.endDate,),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TagView(color: data.status.color(context), child: Text(data.status.title(context), style: Theme.of(context).textTheme.labelMedium,)),
                  const SizedBox(height: 8,),
                  TagView(color: data.type.color(context), child: Text(data.type.title(context), style: Theme.of(context).textTheme.labelMedium,))
                ],
              )
            ],
          ),
          AbsenceNoteView(label: '${context.local.member_note} : ', note: data.memberNote ?? ''),
          AbsenceNoteView(label: '${context.local.admitter_note} : ', note: data.admitterNote ?? ''),
        ],
      ),
    );
  }
}





