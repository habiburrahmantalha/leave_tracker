import 'package:dio/dio.dart';
import 'package:leave_tracker/core/network/api_endpoint.dart';
import 'package:leave_tracker/core/network/dio_singleton.dart';
import 'package:leave_tracker/ui/absence_list/data/models/response_absence_list_model.dart';
import 'package:leave_tracker/ui/absence_list/domain/repositories/repository_absence_list.dart';

class RepositoryAbsenceListImplementation implements RepositoryAbsenceList {

  @override
  Future<ResponseAbsenceListModel> getAbsenceList(String? filter) async {
    Response response = await getHttp(ApiEndpoint.absences(filter));
    return ResponseAbsenceListModel.fromJson(response.data);
  }
}