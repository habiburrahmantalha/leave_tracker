import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

/// A shimmering placeholder for loading content.
class ShimmerCardView extends StatelessWidget {
  /// Creates an instance of [ShimmerCardView].
  const ShimmerCardView({super.key});

  @override
  Widget build(final BuildContext context) {
    final Color baseColor = Theme.of(context).colorScheme.primaryContainer.withOpacity(0.2);
    final Color highlightColor = Theme.of(context).colorScheme.primaryContainer.withOpacity(0.7);
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.2),
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(4), topRight: Radius.circular(4), ),
          ),
          child: Opacity(
            opacity: 0.8,
            child: Shimmer.fromColors(
              baseColor: baseColor,
              highlightColor: highlightColor,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(height: 32, width: 32, decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(100),
                  ),),
                  const SizedBox(width: 8,),
                  Container(height: 24, width: 80, color: baseColor,),
                ],
              ),
            ),
          ),
        ),
        Divider(thickness: 1,height: 2, color: baseColor,),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.2),
              borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(4), bottomRight: Radius.circular(4), ),
          ),
          child: Row(
            children: [
              Shimmer.fromColors(
                  baseColor: baseColor,
                  highlightColor: highlightColor,
                  child: Container(
                      decoration: BoxDecoration(
                          color: baseColor,
                          borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(4), bottomRight: Radius.circular(4), ),
                      ),
                      height: 24,
                      width: 80,),
              ),
              const SizedBox(width: 24,),
              Shimmer.fromColors(
                  baseColor: baseColor,
                  highlightColor: highlightColor,
                  child: Container(
                      decoration: BoxDecoration(
                          color: baseColor,
                          borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(4), bottomRight: Radius.circular(4), ),
                      ),
                      height: 24,
                      width: 128,
                  ),
              ),
            ],
          ),
        ),
        Divider(thickness: 1,height: 2, color: baseColor,),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.2),
              borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(4), bottomRight: Radius.circular(4) ),
          ),
          child: Row(
            children: [
              Shimmer.fromColors(
                  baseColor: baseColor,
                  highlightColor: highlightColor,
                  child: Container(
                      decoration: BoxDecoration(
                          color: baseColor,
                          borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(4), bottomRight: Radius.circular(4) ),
                      ),
                      height: 24,
                      width: 96,),
              ),
              const SizedBox(width: 24,),
              Shimmer.fromColors(
                  baseColor: baseColor,
                  highlightColor: highlightColor,
                  child: Container(
                      decoration: BoxDecoration(
                          color: baseColor,
                          borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(4), bottomRight: Radius.circular(4) ),
                      ),
                      height: 24,
                      width: 160,),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// A shimmering placeholder for loading content.
class ShimmerCardList extends StatelessWidget {
  /// Creates an instance of [ShimmerCardView].
  const ShimmerCardList({super.key, this.items});

  /// Shimmer card count
  final int? items;

  @override
  Widget build(final BuildContext context) {
    return ListView.separated(
        physics: const ClampingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        itemCount: items ?? 5,
        shrinkWrap: true,
        separatorBuilder: (final context, final index){
          return const SizedBox(height: 12,);
        },
        itemBuilder: (final context, final index){
          return const ShimmerCardView();
        },);
  }
}