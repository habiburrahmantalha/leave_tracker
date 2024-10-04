class MemberModel {
  MemberModel({
      this.crewId, 
      this.id, 
      this.image, 
      this.name, 
      this.userId,});

  MemberModel.fromJson(json) {
    crewId = json['crewId'] as int?;
    id = json['id'] as int?;
    image = json['image'] as String?;
    name = json['name'] as String?;
    userId = json['userId'] as int?;
  }
  int? crewId;
  int? id;
  String? image;
  String? name;
  int? userId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['crewId'] = crewId;
    map['id'] = id;
    map['image'] = image;
    map['name'] = name;
    map['userId'] = userId;
    return map;
  }
}