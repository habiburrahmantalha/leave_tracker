import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:leave_tracker/core/constants/enums.dart';
import 'package:leave_tracker/core/resource/theme.dart';

extension StringExtension on String {
  String capitalize(){
    if(isEmpty) return  '';
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}

extension DarkMode on BuildContext {
  /// is dark mode currently enabled?
  bool get isDarkMode {
    final brightness = MediaQuery.of(this).platformBrightness;
    return brightness == Brightness.dark;
  }
}

extension DateTimeExtension on DateTime?{

  String toddMMMyy(){
    if(this != null){
      final DateFormat dateFormat = DateFormat('dd MMM, yyyy');
      return dateFormat.format(this!) ;
    }else{
      return '';
    }
  }
}

extension AbsenceTypeExtension on AbsenceType? {
  Color? color(final BuildContext context) {
    return switch(this) {
      null => Colors.transparent,
      AbsenceType.vacation => Theme.of(context).extension<CustomStatusColors>()?.vacationColor,
      AbsenceType.sickness => Theme.of(context).extension<CustomStatusColors>()?.sicknessColor,
    };
  }
}

extension AbsenceStatusExtension on AbsenceStatus? {
  Color? color(final BuildContext context) {
    return switch(this) {
      null => Colors.transparent,
      AbsenceStatus.confirmed => Theme.of(context).extension<CustomStatusColors>()?.confirmedColor,
      AbsenceStatus.rejected => Theme.of(context).extension<CustomStatusColors>()?.rejectedColor,
      AbsenceStatus.requested => Theme.of(context).extension<CustomStatusColors>()?.requestedColor,
    };
  }
}