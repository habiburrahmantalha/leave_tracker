import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:leave_tracker/core/constants/enums.dart';
import 'package:leave_tracker/core/resource/theme.dart';

/// [String] extension
extension StringExtension on String {
  /// capitalize string
  String capitalize(){
    if(isEmpty) return  '';
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}

/// easier access to check app theme mode
extension DarkMode on BuildContext {
  /// is dark mode currently enabled?
  bool get isDarkMode {
    final brightness = MediaQuery.of(this).platformBrightness;
    return brightness == Brightness.dark;
  }
}

/// [DateTime] extension
extension DateTimeExtension on DateTime?{

  /// convert date time to dd MMM, yyyy format
  String toddMMMyy(){
    if(this != null){
      final DateFormat dateFormat = DateFormat('dd MMM, yyyy');
      return dateFormat.format(this!) ;
    }else{
      return '';
    }
  }
}

///[AbsenceType] extension to get theme based color
extension AbsenceTypeExtension on AbsenceType? {
  /// return color
  Color? color(final BuildContext context) {
    return switch(this) {
      null => Colors.transparent,
      AbsenceType.vacation => Theme.of(context).extension<CustomStatusColors>()?.vacationColor,
      AbsenceType.sickness => Theme.of(context).extension<CustomStatusColors>()?.sicknessColor,
    };
  }
}

///[AbsenceStatus] extension to get theme based color
extension AbsenceStatusExtension on AbsenceStatus? {
  /// return color
  Color? color(final BuildContext context) {
    return switch(this) {
      null => Colors.transparent,
      AbsenceStatus.confirmed => Theme.of(context).extension<CustomStatusColors>()?.confirmedColor,
      AbsenceStatus.rejected => Theme.of(context).extension<CustomStatusColors>()?.rejectedColor,
      AbsenceStatus.requested => Theme.of(context).extension<CustomStatusColors>()?.requestedColor,
    };
  }
}