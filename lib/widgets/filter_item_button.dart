import 'package:flutter/material.dart';

import 'tag_view.dart';

/// A button widget representing a filter item.
class FilterItemButton extends StatelessWidget {
  /// Creates a [FilterItemButton] widget.
  const FilterItemButton({super.key, required this.label, required this.onClear});

  /// The [label] is displayed on the button,
  final String label;
  /// the [onClear] callback is triggered when the button is pressed.
  final Function onClear;

  @override
  Widget build(final BuildContext context) {
    return TagView(
        radius: 20,
        padding: EdgeInsets.zero,
        color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.2),
        child: Row(
          children: [
            const SizedBox(width: 12,),
            Text(label, style: Theme.of(context).textTheme.labelMedium,),
            IconButton(padding: EdgeInsets.zero,
                visualDensity: VisualDensity.compact,
                onPressed: ()=> onClear(), icon: const Icon(Icons.close),
            ),
          ],
        ),
    );
  }
}
