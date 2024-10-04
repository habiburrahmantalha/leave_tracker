import 'package:equatable/equatable.dart';
import 'package:leave_tracker/ui/absence_list/data/models/member_model.dart';

class Member extends Equatable {
  const Member({
    this.crewId,
    this.id,
    this.image,
    this.name,
    this.userId,
  });

  final int? crewId;
  final int? id;
  final String? image;
  final String? name;
  final int? userId;

  // Factory constructor to create MemberEntity from MemberModel
  factory Member.fromModel(final MemberModel model) {
    return Member(
      crewId: model.crewId,
      id: model.id,
      image: model.image,
      name: model.name,
      userId: model.userId,
    );
  }

  @override
  List<Object?> get props => [crewId, id, image, name, userId];
}
