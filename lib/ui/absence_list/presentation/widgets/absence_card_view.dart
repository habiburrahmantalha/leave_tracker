import 'package:flutter/material.dart';
import 'package:leave_tracker/ui/absence_list/domain/entities/absence.dart';
import 'package:leave_tracker/widgets/raw_button.dart';


class AbsenceCardView extends StatelessWidget {
  const AbsenceCardView({super.key, required this.data});

  final Absence data;

  @override
  Widget build(BuildContext context) {

    return RawButton(
      padding: EdgeInsets.all(12),
      onTap: (){

      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        ],
      ),
    );
  }
}





