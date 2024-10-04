import 'package:leave_tracker/core/network/api_endpoint.dart';
import 'package:leave_tracker/core/network/dio_singleton.dart';
import 'package:leave_tracker/ui/absence_list/data/models/response_absence_list_model.dart';
import 'package:leave_tracker/ui/absence_list/domain/repositories/repository_absence_list.dart';

/// A concrete implementation of [RepositoryAbsenceList].
///
/// This class is responsible for fetching absence data from a remote source,
/// such as a REST API. It implements the methods defined in the
/// [RepositoryAbsenceList] interface.
class RepositoryAbsenceListImplementation implements RepositoryAbsenceList {

  @override
  Future<ResponseAbsenceListModel> getAbsenceList(final String? filter) async {
    final response = await getHttp(ApiEndpoint.absences(filter));
    return ResponseAbsenceListModel.fromJson(response.data);
  }
}