part of 'absence_bloc.dart';

/// Represents the state of the absence list.
class AbsenceState extends BaseStateList {

  /// The list of absences.
  final List<Absence>? list;

  /// The currently selected filter for the absence list.
  final AbsenceFilter? selectedFilter;

  /// Creates an instance of [AbsenceState].
  const AbsenceState({
    super.currentPage,
    super.totalPage,
    super.totalCount,
    super.status,
    this.list,
    this.selectedFilter,
  });

  @override
  List<Object?> get props =>
      [
        currentPage,
        totalPage,
        totalCount,
        status,
        list,
        selectedFilter,
      ];

  @override
  AbsenceState copyWith({
    final int? currentPage,
    final int? totalPage,
    final int? totalCount,
    final LoadingStatus? status,
    final List<Absence>? list,
    final AbsenceFilter? selectedFilter,
  }) {
    return AbsenceState(
      currentPage: currentPage ?? this.currentPage,
      totalPage: totalPage ?? this.totalPage,
      totalCount: totalCount ?? this.totalCount,
      status: status ?? this.status,
      list: list ?? this.list,
      selectedFilter: selectedFilter ?? this.selectedFilter,
    );
  }
}


