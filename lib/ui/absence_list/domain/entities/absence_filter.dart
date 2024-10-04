import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:leave_tracker/core/constants/enums.dart';
import 'package:leave_tracker/core/utils/utils.dart';

/// Represents a filter for absence records.
///
/// The [AbsenceFilter] class encapsulates criteria that can be used
/// to filter absence records based on type, status, and date range.
class AbsenceFilter extends Equatable {
  /// The type of absence to filter (e.g., vacation, sickness).
  final AbsenceType? type;

  /// The status of absence to filter (e.g., requested, confirmed, rejected).
  final AbsenceStatus? status;

  /// The range of dates to filter absences.
  final DateTimeRange? dateTimeRange;

  /// Creates a new instance of [AbsenceFilter].
  ///
  /// All parameters are optional. If no parameters are provided,
  /// the filter will be created with null values.
  const AbsenceFilter({
    this.type,
    this.status,
    this.dateTimeRange,
  });

  @override
  List<Object?> get props => [type, status, dateTimeRange];

  /// Creates a copy of the current state with modified properties.
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

  ///Check is any filter selected
  bool get isFilterSelected {
    return type != null || status != null || dateTimeRange != null;
  }

  /// Convert the filter object to query parameter
  String toQueryParameter(final int page){
    final Map<String, dynamic> filter = toMap(page);
    filter.removeWhere((final key, final value) => value == null);
    printDebug(Uri(queryParameters: filter).query);
    return Uri(queryParameters: filter).query;
  }

  /// Convert the filter object to JSON
  Map<String, dynamic> toMap(final int page) {
    return {
      'type': type?.value,
      'status': status?.value,
      'startDate': dateTimeRange?.start.toIso8601String(),
      'endDate': dateTimeRange?.end.toIso8601String(),
      'page': page.toString(),
    };
  }
}