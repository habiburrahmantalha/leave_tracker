import 'package:equatable/equatable.dart';
import 'package:leave_tracker/core/constants/enums.dart';
import 'package:leave_tracker/ui/absence_list/data/models/absence_model.dart';
import 'package:leave_tracker/ui/absence_list/domain/entities/member.dart';

class Absence extends Equatable {
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

  final int id;
  final Member? member;
  final AbsenceType type;
  final DateTime? confirmedAt;
  final DateTime? createdAt;
  final DateTime? rejectedAt;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? memberNote;
  final AbsenceStatus status;
  final String? admitterNote;

  // Convert AbsenceModel to AbsenceEntity
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

  // Helper to parse String to DateTime
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
