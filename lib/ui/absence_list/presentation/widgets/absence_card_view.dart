import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:leave_tracker/core/utils/extensions.dart';
import 'package:leave_tracker/core/utils/i_cal_service.dart';
import 'package:leave_tracker/l10n/localization.dart';
import 'package:leave_tracker/ui/absence_details/presentation/screens/screen_absence_details.dart';
import 'package:leave_tracker/ui/absence_list/domain/entities/absence.dart';
import 'package:leave_tracker/widgets/raw_button.dart';
import 'package:leave_tracker/widgets/tag_view.dart';

import 'absence_note_view.dart';
import 'absence_period_view.dart';
import 'member_info_view.dart';

/// A widget that displays information about an absence in a card format.
class AbsenceCardView extends StatelessWidget {
  /// Creates an instance of [AbsenceCardView].
  ///
  /// The [data] parameter is required and represents the absence information to be displayed.
  const AbsenceCardView({super.key, required this.data});

  /// The absence data that this card will display.
  final Absence data;

  @override
  Widget build(final BuildContext context) {

    return RawButton(
      padding: const EdgeInsets.all(12),
      onTap: (){
        context.go(ScreenAbsenceDetails.routeName, extra: data);
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
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TagView(color: data.status.color(context), child: Text(data.status.title(context), style: Theme.of(context).textTheme.labelMedium,),),
                  const SizedBox(height: 8,),
                  TagView(color: data.type.color(context), child: Text(data.type.title(context), style: Theme.of(context).textTheme.labelMedium,),),
                ],
              ),
            ],
          ),
          AbsencePeriodView(start: data.startDate, end: data.endDate, onTap: (){
            createAndSaveSingleDateAbsence(data);
          },),
          AbsenceNoteView(label: '${context.local.member_note} : ', note: data.memberNote ?? ''),
          AbsenceNoteView(label: '${context.local.admitter_note} : ', note: data.admitterNote ?? ''),
        ],
      ),
    );
  }
}





