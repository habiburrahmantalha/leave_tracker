import 'package:flutter/material.dart';

/// A customizable widget for displaying an empty view.
class EmptyView extends StatelessWidget {
  /// Creates a [EmptyView] widget.
  const EmptyView({super.key,
    this.image,
    required this.title,
    this.description,
    this.button,
    this.paddingTop = 128,
    this.horizontal,
    this.titleColor,
    this.descriptionColor,
    this.titleWeight,
    this.titleFontSize,
    this.descriptionWeight,
    this.descriptionFontSize,
  });

  /// An optional image displayed at the top of the card.
  final Widget? image;

  /// The title text displayed prominently on the card.
  final String title;

  /// An optional description text displayed below the title.
  final String? description;

  /// An optional button displayed at the bottom of the card.
  final Widget? button;

  /// Optional padding applied to the top of the card.
  final double? paddingTop;

  /// Optional horizontal padding applied to the card.
  final double? horizontal;

  /// Optional color for the title text.
  final Color? titleColor;

  /// Optional color for the description text.
  final Color? descriptionColor;

  /// Optional font weight for the title text.
  final FontWeight? titleWeight;

  /// Optional font weight for the description text.
  final FontWeight? descriptionWeight;

  /// Optional font size for the title text.
  final double? titleFontSize;

  /// Optional font size for the description text.
  final double? descriptionFontSize;

  @override
  Widget build(final BuildContext context) {
    return ListView(
      shrinkWrap: true,
      //physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: horizontal ?? 32),
      children: [
        SizedBox(height: paddingTop,),
        if(image!= null)
        Center(child: image),
        const SizedBox(height: 12,),
        Center(child: Text(title,  style: Theme.of(context).textTheme.labelLarge)),
        const SizedBox(height: 12,),
        if(description != null)
        Center(child: Text(description ?? '', textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyMedium,)),
        const SizedBox(height: 24,),
        if(button != null)
          button!,
      ],
    );
  }
}


