import 'package:equatable/equatable.dart';
import 'package:leave_tracker/core/constants/enums.dart';
import 'package:leave_tracker/ui/absence_list/data/models/absence_model.dart';
import 'package:leave_tracker/ui/absence_list/domain/entities/member.dart';

/// Represents an absence record.
///
/// The [Absence] class contains details about a specific absence,
/// including the member associated with the absence, its type,
/// dates, and status.
class Absence extends Equatable {
  /// Creates an instance of [Absence].
  ///
  /// All parameters are required except for [memberNote] and
  /// [admitterNote], which are optional.
  const Absence({
    required this.id,
    required this.member,
    required this.type,
    this.confirmedAt,
    this.createdAt,
    this.rejectedAt,
    this.startDate,
    this.endDate,
    this.memberNote,
    required this.status,
    this.admitterNote,
  });

  /// The unique identifier for the absence record.
  final int id;

  /// The member associated with the absence. Can be null if not specified.
  final Member? member;

  /// The type of absence (e.g., vacation or sickness).
  final AbsenceType type;

  /// The date when the absence was confirmed. Can be null if not confirmed.
  final DateTime? confirmedAt;

  /// The date when the absence record was created.
  final DateTime? createdAt;

  /// The date when the absence was rejected. Can be null if not rejected.
  final DateTime? rejectedAt;

  /// The start date of the absence. Can be null if not specified.
  final DateTime? startDate;

  /// The end date of the absence. Can be null if not specified.
  final DateTime? endDate;

  /// A note provided by the member regarding the absence. Can be null.
  final String? memberNote;

  /// The current status of the absence (e.g., requested, confirmed, rejected).
  final AbsenceStatus status;

  /// A note provided by the admitter regarding the absence. Can be null.
  final String? admitterNote;

  /// Convert AbsenceModel to AbsenceEntity
  factory Absence.fromModel(final AbsenceModel model) {
    return Absence(
      id: model.id ?? 0,
      member: model.member != null ? Member.fromModel(model.member!) : null,
      type: AbsenceType.values.firstWhere((final e) => e.value == model.type,
          orElse: () => AbsenceType.vacation,),
      confirmedAt: _parseDateTime(model.confirmedAt),
      createdAt: _parseDateTime(model.createdAt),
      rejectedAt: _parseDateTime(model.rejectedAt),
      startDate: _parseDateTime(model.startDate),
      endDate: _parseDateTime(model.endDate),
      memberNote: model.memberNote ?? '',
      status: AbsenceStatus.values.firstWhere((final e) => e.value == model.status,
          orElse: () => AbsenceStatus.requested,),
      admitterNote: model.admitterNote ?? '',
    );
  }

  /// Helper to parse String to DateTime
  static DateTime? _parseDateTime(final String? date) {
    return DateTime.tryParse(date ?? '');
  }

  @override
  List<Object?> get props =>
      [
        id,
        member,
        type,
        confirmedAt,
        createdAt,
        rejectedAt,
        startDate,
        endDate,
        memberNote,
        status,
        admitterNote,
      ];
}
