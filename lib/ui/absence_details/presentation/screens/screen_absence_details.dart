import 'package:flutter/material.dart';
import 'package:leave_tracker/core/constants/enums.dart';
import 'package:leave_tracker/core/resource/resource.dart';
import 'package:leave_tracker/core/utils/extensions.dart';
import 'package:leave_tracker/core/utils/i_cal_service.dart';
import 'package:leave_tracker/l10n/localization.dart';
import 'package:leave_tracker/ui/absence_details/presentation/widgets/absence_info_view.dart';
import 'package:leave_tracker/ui/absence_list/domain/entities/absence.dart';
import 'package:leave_tracker/ui/absence_list/presentation/widgets/absence_note_view.dart';
import 'package:leave_tracker/ui/absence_list/presentation/widgets/absence_period_view.dart';
import 'package:leave_tracker/ui/absence_list/presentation/widgets/member_info_view.dart';
import 'package:leave_tracker/widgets/tag_view.dart';

/// A screen that displays detailed information about a specific absence.
///
/// This screen receives an [Absence] object, which contains information about
/// the member, the start and end dates of the absence, and its status.
/// The detailed absence information is presented in a readable format
/// to provide the user with all the relevant details.
class ScreenAbsenceDetails extends StatefulWidget {
  ///named route for home screens
  static const String routeName = '/absence_details';
  ///Creates instance
  const ScreenAbsenceDetails({super.key, required this.absence});
  /// The absence data that will be displayed on this screen.
  ///
  /// This [Absence] object includes details about the member's absence,
  /// such as the member's name, the start and end dates, and the absence status.
  final Absence absence;
  @override
  State<ScreenAbsenceDetails> createState() {
    return _ScreenAbsenceDetailsState();
  }
}

class _ScreenAbsenceDetailsState extends State<ScreenAbsenceDetails> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    final Absence data = widget.absence;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(title: Text('${context.local.absence_details} - ${data.member?.name ?? ''}'),),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: R.dimension.screenHorizontalPadding, vertical: R.dimension.screenVerticalPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: AbsencePeriodView(start: data.startDate, end: data.endDate, onTap: (){
                  createAndSaveSingleDateAbsence(data);
                },),
              ),
              const SizedBox(height: 16,),
              Row(
                children: [
                  Expanded(child: Column(
                    children: [
                      MemberInfoView(image: data.member?.image ?? '', name: data.member?.name ?? ''),
                      AbsenceInfoView(
                        value: Text(data.member?.crewId?.toString() ?? ''),
                        label: '${context.local.user} Id# : ',
                        mainAxisAlignment: MainAxisAlignment.start,
                      ),
                    ],
                  ),),
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
              const Divider(height: 24,),
              AbsenceInfoView(
                value: Text(data.id.toString()),
                label: '${context.local.absence} Id# : ',
                mainAxisAlignment: MainAxisAlignment.start,
              ),
              AbsenceNoteView(label: '${context.local.member_note} : ', note: data.memberNote ?? ''),
              AbsenceNoteView(label: '${context.local.admitter_note} : ', note: data.admitterNote ?? ''),
              const Divider(),
              AbsenceInfoView(
                value: Text(data.createdAt?.toddMMMyy() ?? ''),
                label: '${context.local.created_at} : ',
              ),
              if(data.status == AbsenceStatus.confirmed)...[
                const Divider(),
                AbsenceInfoView(
                  value: Text(data.confirmedAt?.toddMMMyy() ?? ''),
                  label: '${context.local.confirmed_at} : ',
                ),
              ],
              if(data.status == AbsenceStatus.rejected)...[
                const Divider(),
                AbsenceInfoView(
                  value: Text(data.rejectedAt?.toddMMMyy() ?? ''),
                  label: '${context.local.rejected_at} : ',
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

