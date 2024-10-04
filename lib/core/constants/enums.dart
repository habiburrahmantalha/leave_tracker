import 'package:flutter/material.dart';
import 'package:leave_tracker/l10n/localization.dart';

enum LoadingStatus {
  initial,
  loading,
  success,
  failed;

  bool get isLoading => this == LoadingStatus.loading;

  bool get isSuccess => this == LoadingStatus.success;

  bool get isFailed => this == LoadingStatus.failed;
}

enum ToastType{
  regular('regular'),
  warning('warning'),
  error('error'),
  success('success');

  const ToastType(this.value);
  final String value;
}

enum AbsenceType {
  vacation(value: 'vacation'),
  sickness(value: 'sickness');
  const AbsenceType({required this.value});
  final String value;


  String title(final BuildContext context) {
    switch (this) {
      case AbsenceType.vacation:
        return context.local.vacation;
      case AbsenceType.sickness:
        return context.local.sickness;
    }
  }
}

enum AbsenceStatus {
  requested(value: 'requested'),
  confirmed(value: 'confirmed'),
  rejected(value: 'rejected');
  const AbsenceStatus({required this.value});
  final String value;

  String title(final BuildContext context) {
    switch (this) {
      case AbsenceStatus.requested:
        return context.local.requested;
      case AbsenceStatus.confirmed:
        return context.local.confirmed;
      case AbsenceStatus.rejected:
        return context.local.rejected;
    }
  }
}