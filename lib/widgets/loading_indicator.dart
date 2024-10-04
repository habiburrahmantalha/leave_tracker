
import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  final double size;
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