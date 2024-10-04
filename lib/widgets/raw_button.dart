import 'package:flutter/material.dart';

/// A customizable button widget that can handle tap and long press actions.
class RawButton extends StatelessWidget {
  /// Creates a [RawButton] widget.
  const RawButton({
    super.key,
    required this.child,
    required this.onTap,
    this.onLongPress,
    this.radius = 8,
    this.color,
    this.padding = EdgeInsets.zero,
    this.margin = EdgeInsets.zero,
    this.elevation = 0,
  });

  /// The child widget displayed inside the card.
  final Widget child;

  /// Callback function executed on tap.
  final Function onTap;

  /// Optional callback function executed on long press.
  final Function? onLongPress;

  /// The corner radius of the card.
  final double radius;

  /// The background color of the card.
  final Color? color;

  /// The padding inside the card.
  final EdgeInsetsGeometry padding;

  /// The margin outside the card.
  final EdgeInsetsGeometry margin;

  /// The elevation of the card.
  final double elevation;

  @override
  Widget build(final BuildContext context) {
    return Container(
      margin: margin,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: Material(
          elevation: elevation,
          color: color ?? Theme.of(context).colorScheme.primaryContainer.withOpacity(0.2),
          child: InkWell(
            onTap: ()=> onTap(),
            onLongPress: ()=> onLongPress!= null ? onLongPress!() : onTap(),
            child: Container(
                padding: padding,
                child: child,
            ),
          ),
        ),
      ),
    );
  }
}


