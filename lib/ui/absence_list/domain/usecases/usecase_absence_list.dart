import 'package:leave_tracker/ui/absence_list/data/models/response_absence_list_model.dart';
import 'package:leave_tracker/ui/absence_list/domain/entities/absence.dart';
import 'package:leave_tracker/ui/absence_list/domain/entities/response_absence.dart';
import 'package:leave_tracker/ui/absence_list/domain/repositories/repository_absence_list.dart';


class UseCaseAbsenceList {
  final RepositoryAbsenceList repository;

  UseCaseAbsenceList(this.repository);

  Future<ResponseAbsenceList> getAbsenceList({final String? filter}) async {
    final ResponseAbsenceListModel response = await repository.getAbsenceList(filter);
    return ResponseAbsenceList(
      list: (response.absences ?? []).map((final e) => Absence.fromModel(e)).toList(),
      currentPage: response.page ?? 1,
      totalPage: ((response.totalAbsences ?? 1) / 10).ceil(),
      totalCount: response.totalAbsences ?? 0,
    );
  }
}