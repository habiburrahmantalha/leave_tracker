import 'package:equatable/equatable.dart';
import 'package:leave_tracker/ui/absence_list/data/models/member_model.dart';

/// Represents a member in the absence management system.
///
/// The [Member] class holds information about a specific member,
/// including their identification details and associated crew.
class Member extends Equatable {
  /// Creates a new instance of [Member].
  ///
  /// All parameters are optional. If no parameters are provided,
  /// the member will be created with null values.
  const Member({
    this.crewId,
    this.id,
    this.image,
    this.name,
    this.userId,
  });

  /// The crew identifier associated with the member.
  final int? crewId;

  /// The unique identifier for the member.
  final int? id;

  /// The URL of the member's image.
  final String? image;

  /// The name of the member.
  final String? name;

  /// The user identifier associated with the member.
  final int? userId;

  /// Factory constructor to create MemberEntity from MemberModel
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
