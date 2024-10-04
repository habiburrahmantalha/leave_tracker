part of 'absence_bloc.dart';

class AbsenceState extends BaseStateList {

  final List<Absence>? list;
  final AbsenceType? selectedAbsenceType;

  const AbsenceState({
    super.currentPage,
    super.totalPage,
    super.totalCount,
    super.status,
    this.list,
    this.selectedAbsenceType
  });

  @override
  List<Object?> get props =>
      [
        currentPage,
        totalPage,
        totalCount,
        status,
        list,
        selectedAbsenceType
      ];

  @override
  AbsenceState copyWith({
    int? currentPage,
    int? totalPage,
    int? totalCount,
    LoadingStatus? status,
    List<Absence>? list,
    AbsenceType? selectedAbsenceType,
    bool? removeAbsenceType
  }) {
    return AbsenceState(
      currentPage: currentPage ?? this.currentPage,
      totalPage: totalPage ?? this.totalPage,
      totalCount: totalCount ?? this.totalCount,
      status: status ?? this.status,
      list: list ?? this.list,
      selectedAbsenceType: removeAbsenceType == true ? null : selectedAbsenceType ?? this.selectedAbsenceType
    );
  }
}


