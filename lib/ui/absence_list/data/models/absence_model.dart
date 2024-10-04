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

  AbsenceModel.fromJson(json) {
    id = json['id'] as int?;
    member = json['member'] != null ? MemberModel.fromJson(json['member']) : null;
    type = json['type'] as String?;
    confirmedAt = json['confirmedAt'] as String?;
    createdAt = json['createdAt'] as String?;
    rejectedAt = json['rejectedAt'] as String?;
    startDate = json['startDate'] as String?;
    endDate = json['endDate'] as String?;
    memberNote = json['memberNote'] as String?;
    status = json['status'] as String?;
    admitterNote = json['admitterNote'] as String?;
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