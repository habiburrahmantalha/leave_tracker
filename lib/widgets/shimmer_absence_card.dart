import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCardView extends StatelessWidget {
  const ShimmerCardView({super.key});

  @override
  Widget build(BuildContext context) {
    Color baseColor = Theme.of(context).colorScheme.primaryContainer.withOpacity(0.2);
    Color highlightColor = Theme.of(context).colorScheme.primaryContainer.withOpacity(0.7);
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.2),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(4), topRight: Radius.circular(4) )
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
                      borderRadius: BorderRadius.circular(100)
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
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(4), bottomRight: Radius.circular(4) )
          ),
          child: Row(
            children: [
              Shimmer.fromColors(
                  baseColor: baseColor,
                  highlightColor: highlightColor,
                  child: Container(
                      decoration: BoxDecoration(
                          color: baseColor,
                          borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(4), bottomRight: Radius.circular(4) )
                      ),
                      height: 24,
                      width: 80)
              ),
              SizedBox(width: 24,),
              Shimmer.fromColors(
                  baseColor: baseColor,
                  highlightColor: highlightColor,
                  child: Container(
                      decoration: BoxDecoration(
                          color: baseColor,
                          borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(4), bottomRight: Radius.circular(4) )
                      ),
                      height: 24,
                      width: 128)
              )
            ],
          ),
        ),
        Divider(thickness: 1,height: 2, color: baseColor,),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.2),
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(4), bottomRight: Radius.circular(4) )
          ),
          child: Row(
            children: [
              Shimmer.fromColors(
                  baseColor: baseColor,
                  highlightColor: highlightColor,
                  child: Container(
                      decoration: BoxDecoration(
                          color: baseColor,
                          borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(4), bottomRight: Radius.circular(4) )
                      ),
                      height: 24,
                      width: 96)
              ),
              SizedBox(width: 24,),
              Shimmer.fromColors(
                  baseColor: baseColor,
                  highlightColor: highlightColor,
                  child: Container(
                      decoration: BoxDecoration(
                          color: baseColor,
                          borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(4), bottomRight: Radius.circular(4) )
                      ),
                      height: 24,
                      width: 160)
              )
            ],
          ),
        ),
      ],
    );
  }
}

class ShimmerCardList extends StatelessWidget {
  const ShimmerCardList({super.key, this.items});

  final int? items;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: const ClampingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        itemCount: items ?? 5,
        shrinkWrap: true,
        separatorBuilder: (context, index){
          return SizedBox(height: 12,);
        },
        itemBuilder: (context, index){
          return const ShimmerCardView();
        });
  }
}