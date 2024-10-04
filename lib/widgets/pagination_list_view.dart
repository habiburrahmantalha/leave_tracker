import 'package:flutter/material.dart';
import 'package:leave_tracker/core/constants/enums.dart';
import 'package:leave_tracker/widgets/loading_indicator.dart';

/// A customizable list widget that displays items with loading and empty states.
class PaginationListView extends StatelessWidget {
  /// The total number of items to display.
  final int count;

  /// The widget displayed when the list is loading.
  final Widget? loadingView;

  /// The widget displayed when the list is empty.
  final Widget? emptyView;

  /// The current loading status of the list.
  final LoadingStatus status;

  /// A builder function to create the item widgets.
  final Widget Function(BuildContext, int) itemBuilder;

  /// A callback function that updates based on scroll notifications.
  final bool Function(ScrollNotification, bool) onNotificationUpdate;

  /// An optional widget displayed between list items.
  final Widget? separator;

  /// Whether to reverse the order of the list items.
  final bool reverse;

  /// The padding around the list items.
  final EdgeInsets padding;

  /// The physics applied to the scroll view.
  final ScrollPhysics? physics;

  /// Creates a [PaginationListView] widget.
  const PaginationListView({super.key,
    required this.status,
    required this.count,
    required this.onNotificationUpdate,
    this.loadingView,
    this.emptyView,
    required this.itemBuilder,
    this.separator,
    this.reverse = false,
    this.padding = EdgeInsets.zero,
    this.physics,
  });

  @override
  Widget build(final BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (final scrollNotification) => onNotificationUpdate(scrollNotification, status == LoadingStatus.loading),
      child: count == 0 && status == LoadingStatus.loading ?
      loadingView ?? const LoadingIndicator() :
      status == LoadingStatus.success && count == 0 ? emptyView ?? const SizedBox.shrink() :
      ListView.separated(
        physics: physics,
        padding: padding,
        cacheExtent: 1.0,
        shrinkWrap: true,
        itemCount: count + 1,
        reverse: reverse,
        separatorBuilder: (final context, final index) => index == count-1 ? const SizedBox.shrink() : separator ?? Container(),
        itemBuilder: (final context, final index)=> index == count ?
        status == LoadingStatus.loading ? loadingView ?? const LoadingIndicator() : const SizedBox.shrink()
            : itemBuilder(context, index),
      ),
    );
  }
}
