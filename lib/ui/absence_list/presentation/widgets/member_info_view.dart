import 'package:flutter/material.dart';
import 'package:leave_tracker/generated/assets.dart';

class MemberInfoView extends StatelessWidget {
  const MemberInfoView({
    super.key, required this.image, required this.name,
  });

  final String image;
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