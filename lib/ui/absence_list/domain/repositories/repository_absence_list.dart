import 'package:leave_tracker/ui/absence_list/data/models/response_absence_list_model.dart';

abstract interface class RepositoryAbsenceList {
  Future<ResponseAbsenceListModel> getAbsenceList(final String? filter);
}