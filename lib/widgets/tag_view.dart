import 'package:flutter/material.dart';

class TagView extends StatelessWidget {
  const TagView({super.key,
    this.color,
    this.textColor,
    this.radius = 6,
    this.padding,
    this.borderColor, required this.child});

  final Widget child;
  final Color? textColor;
  final Color? color;
  final double radius;
  final EdgeInsets? padding;
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
            border: Border.all(color: borderColor ?? color ?? Colors.transparent)
        ),
        child: child,
      ),
    );
  }
}