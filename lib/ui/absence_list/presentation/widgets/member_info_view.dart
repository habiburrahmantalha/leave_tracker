import 'package:flutter/material.dart';
import 'package:leave_tracker/generated/assets.dart';

class MemberInfoView extends StatelessWidget {
  const MemberInfoView({
    super.key, required this.image, required this.name,
  });

  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 18,
          backgroundImage: image.isNotEmpty ? NetworkImage(image) : AssetImage(Assets.imagesDefaultImage),
        ),
        SizedBox(width: 12,),
        Text(name, style: Theme.of(context).textTheme.titleMedium),
      ],
    );
  }
}