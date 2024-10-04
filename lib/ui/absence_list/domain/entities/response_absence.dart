import 'absence.dart';

class ResponseAbsenceList{
  List<Absence> list;
  int currentPage;
  int totalPage;
  int totalCount;

  ResponseAbsenceList({
    required this.list,
    required this.currentPage,
    required this.totalPage,
    required this.totalCount,
  });
}