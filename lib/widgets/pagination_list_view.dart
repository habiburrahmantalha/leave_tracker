import 'package:flutter/material.dart';
import 'package:leave_tracker/core/constants/enums.dart';
import 'package:leave_tracker/widgets/loading_indicator.dart';


class PaginationListView extends StatelessWidget {
  final int count;
  final Widget? loadingView;
  final Widget? emptyView;
  final LoadingStatus status;
  final Widget Function(BuildContext, int) itemBuilder;
  final bool Function(ScrollNotification, bool) onNotificationUpdate;
  final Widget? separator;
  final bool reverse;
  final EdgeInsets padding;
  final ScrollPhysics? physics;

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
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (scrollNotification) => onNotificationUpdate(scrollNotification, status == LoadingStatus.loading),
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
        separatorBuilder: (context, index) => index == count-1 ? const SizedBox.shrink() : separator ?? Container(),
        itemBuilder: (context, index)=> index == count ?
        status == LoadingStatus.loading ? loadingView ?? const LoadingIndicator() : const SizedBox.shrink()
            : itemBuilder(context, index),
      )
    );
  }
}
