import 'package:flutter/material.dart';

/// A widget that displays a customizable tag.
class TagView extends StatelessWidget {
  /// Creates an instance of [TagView].
  const TagView({super.key,
    this.color,
    this.textColor,
    this.radius = 6,
    this.padding,
    this.borderColor, required this.child,});


  /// The widget displayed inside.
  final Widget child;

  /// The color of the text.
  final Color? textColor;

  /// The background color of the widget.
  final Color? color;

  /// The corner radius of the widget.
  final double radius;

  /// Padding around the child widget.
  final EdgeInsets? padding;

  /// The border color of the widget.
  final Color? borderColor;

  @override
  Widget build(final BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        alignment: Alignment.center,
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        decoration: BoxDecoration(
            color: color ?? Colors.transparent,
            borderRadius: BorderRadius.circular(radius),
            border: Border.all(color: borderColor ?? color ?? Colors.transparent),
        ),
        child: child,
      ),
    );
  }
}