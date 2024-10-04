import 'package:leave_tracker/ui/absence_list/data/models/response_absence_list_model.dart';
import 'package:leave_tracker/ui/absence_list/domain/entities/absence.dart';
import 'package:leave_tracker/ui/absence_list/domain/entities/response_absence.dart';
import 'package:leave_tracker/ui/absence_list/domain/repositories/repository_absence_list.dart';


/// A use case for managing absence list operations.
///
/// This class is responsible for handling the business logic related to
/// absence lists, such as fetching, filtering, and manipulating data.
/// It interacts with the [RepositoryAbsenceList] to retrieve and update
/// absence-related information.
class UseCaseAbsenceList {
  /// The repository used for accessing absence list data.
  final RepositoryAbsenceList repository;

  /// Creates an instance of [UseCaseAbsenceList].
  ///
  /// Takes a [repository] parameter which is used to perform operations
  /// related to the absence list.
  UseCaseAbsenceList(this.repository);

  /// Fetches the absence list from the repository.
  ///
  /// This method retrieves a list of absences, optionally filtering the results
  /// based on the provided filter.
  ///
  /// Parameters:
  /// - [filter]: An optional string used to filter the absence list. If null,
  ///   all absences will be returned.
  ///
  /// Returns:
  /// A [Future] that resolves to a [ResponseAbsenceList], which contains the
  /// list of absences and any additional response data.
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