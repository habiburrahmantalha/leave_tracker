import 'absence_model.dart';

class ResponseAbsenceListModel {
  ResponseAbsenceListModel({
      this.totalAbsences, 
      this.absences, 
      this.page, 
      this.limit,});

  ResponseAbsenceListModel.fromJson( json) {
    totalAbsences = json['totalAbsences'] as int?;
    if (json['absences'] != null) {
      absences = [];
      json['absences'].forEach((v) {
        absences?.add(AbsenceModel.fromJson(v));
      });
    }
    page = json['page'] as int?;
    limit = json['limit'] as int?;
  }
  int? totalAbsences;
  List<AbsenceModel>? absences;
  int? page;
  int? limit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['totalAbsences'] = totalAbsences;
    if (absences != null) {
      map['absences'] = absences?.map((v) => v.toJson()).toList();
    }
    map['page'] = page;
    map['limit'] = limit;
    return map;
  }
}



