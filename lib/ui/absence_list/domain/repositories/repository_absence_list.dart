import 'package:leave_tracker/ui/absence_list/data/models/response_absence_list_model.dart';

/// An abstract interface for managing absence list data.
///
/// This interface defines the contract for any repository that handles
/// the retrieval of absence lists. Implementations of this interface
/// should provide concrete methods to fetch absence data from a data source.
abstract interface class RepositoryAbsenceList {

  /// Retrieves a list of absences, optionally filtered by the given filter.
  ///
  /// The method returns a [Future] that resolves to a
  /// [ResponseAbsenceListModel], which contains the list of absences and
  /// any additional response data.
  ///
  /// Parameters:
  /// - [filter]: An optional string used to filter the absence list. If null,
  ///   all absences will be returned.
  Future<ResponseAbsenceListModel> getAbsenceList(final String? filter);
}