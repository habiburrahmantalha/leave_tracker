import 'package:flutter/material.dart';
import 'package:leave_tracker/generated/assets.dart';

/// Displays information about a member, including their image and name.
class MemberInfoView extends StatelessWidget {
  /// Creates an instance of [MemberInfoView].
  ///
  /// The [image] parameter is required and represents the URL or path to the member's image.
  /// The [name] parameter is required and represents the name of the member.
  const MemberInfoView({
    super.key,
    required this.image,
    required this.name,
  });

  /// The URL or path to the member's image.
  final String image;

  /// The name of the member.
  final String name;

  @override
  Widget build(final BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          key: key,
          radius: 18,
          backgroundImage: image.isNotEmpty ? NetworkImage(image,) : const AssetImage(Assets.imagesDefaultImage),
        ),
        const SizedBox(width: 12,),
        Text(name, style: Theme.of(context).textTheme.titleMedium),
      ],
    );
  }
}