import 'member_model.dart';

class AbsenceModel {
  AbsenceModel({
    this.id,
    this.member,
    this.type,
    this.confirmedAt,
    this.createdAt,
    this.rejectedAt,
    this.startDate,
    this.endDate,
    this.memberNote,
    this.status,
    this.admitterNote,});

  AbsenceModel.fromJson(dynamic json) {
    id = json['id'];
    member = json['member'] != null ? MemberModel.fromJson(json['member']) : null;
    type = json['type'];
    confirmedAt = json['confirmedAt'];
    createdAt = json['createdAt'];
    rejectedAt = json['rejectedAt'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    memberNote = json['memberNote'];
    status = json['status'];
    admitterNote = json['admitterNote'];
  }
  int? id;
  MemberModel? member;
  String? type;
  String? confirmedAt;
  String? createdAt;
  String? rejectedAt;
  String? startDate;
  String? endDate;
  String? memberNote;
  String? status;
  String? admitterNote;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (member != null) {
      map['member'] = member?.toJson();
    }
    map['type'] = type;
    map['confirmedAt'] = confirmedAt;
    map['createdAt'] = createdAt;
    map['rejectedAt'] = rejectedAt;
    map['startDate'] = startDate;
    map['endDate'] = endDate;
    map['memberNote'] = memberNote;
    map['status'] = status;
    map['admitterNote'] = admitterNote;
    return map;
  }
}