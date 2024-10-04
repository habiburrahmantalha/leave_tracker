import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:leave_tracker/core/constants/enums.dart';
import 'package:leave_tracker/core/utils/utils.dart';

class AbsenceFilter extends Equatable {
  final AbsenceType? type;
  final AbsenceStatus? status;
  final DateTimeRange? dateTimeRange;

  const AbsenceFilter({
    this.type,
    this.status,
    this.dateTimeRange,
  });

  @override
  List<Object?> get props => [type, status, dateTimeRange];

  AbsenceFilter copyWith({
    final AbsenceType? type,
    final bool? removeType,
    final AbsenceStatus? status,
    final bool? removeStatus,
    final DateTimeRange? dateTimeRange,
    final bool? removeDateTimeRange,
  }) {
    return AbsenceFilter(
      type: removeType == true ? null : type ?? this.type,
      status: removeStatus == true ? null : status ?? this.status,
      dateTimeRange: removeDateTimeRange == true ? null : dateTimeRange ?? this.dateTimeRange,
    );
  }

  bool get isFilterSelected {
    return type != null || status != null || dateTimeRange != null;
  }

  String toQueryParameter(final int page){
    final Map<String, dynamic> filter = toMap(page);
    filter.removeWhere((final key, final value) => value == null);
    printDebug(Uri(queryParameters: filter).query);
    return Uri(queryParameters: filter).query;
  }

  Map<String, dynamic> toMap(final int page) {
    return {
      'type': type?.value,
      'status': status?.value,
      'startDate': dateTimeRange?.start.toIso8601String(),
      'endDate': dateTimeRange?.end.toIso8601String(),
      'page': page.toString()
    };
  }
}