
import 'package:flutter/material.dart';

/// A widget that displays a loading indicator.
class LoadingIndicator extends StatelessWidget {
  /// The [size] property determines the size of the loading indicator, with a default value of 24.0 pixels.
  final double size;
  /// Creates a [LoadingIndicator] widget.
  const LoadingIndicator({super.key, this.size = 24.0});

  @override
  Widget build(final BuildContext context) {
    return Center(
      child: SizedBox(
        height: size,
        width: size,
        child: const CircularProgressIndicator(
          strokeWidth: 3.0,
        ),
      ),
    );
  }
}