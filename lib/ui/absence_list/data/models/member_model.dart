class MemberModel {
  MemberModel({
      this.crewId, 
      this.id, 
      this.image, 
      this.name, 
      this.userId,});

  MemberModel.fromJson(dynamic json) {
    crewId = json['crewId'];
    id = json['id'];
    image = json['image'];
    name = json['name'];
    userId = json['userId'];
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