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
    AbsenceType? type,
    AbsenceStatus? status,
    DateTimeRange? dateTimeRange,
  }) {
    return AbsenceFilter(
      type: type ?? this.type,
      status: status ?? this.status,
      dateTimeRange: dateTimeRange ?? this.dateTimeRange,
    );
  }

  bool get isFilterSelected {
    return type != null || status != null || dateTimeRange != null;
  }

  toQueryParameter(int page){
    Map<String, dynamic> filter = toMap(page);
    filter.removeWhere((key, value) => value == null);
    printDebug(Uri(queryParameters: filter).query);
    return Uri(queryParameters: filter).query;
  }

  Map<String, dynamic> toMap(int page) {
    return {
      'type': type?.value,
      'status': status?.value,
      'startDate': dateTimeRange?.start.toIso8601String(),
      'endDate': dateTimeRange?.end.toIso8601String(),
      'page': page.toString()
    };
  }
}