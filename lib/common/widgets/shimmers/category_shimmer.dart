import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';
import 'shimmer_loader.dart';

class GCategoryShimmer extends StatelessWidget {
  const GCategoryShimmer({
    super.key,
    this.itemCount = 6,
  });

  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: itemCount,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) =>
            const SizedBox(width: GSizes.spaceBtwItems),
        itemBuilder: (_, __) {
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GShimmerEffect(width: 55, height: 55, radius: 55),
              SizedBox(height: GSizes.spaceBtwItems / 2),
              GShimmerEffect(width: 55, height: 8),
            ],
          );
        },
      ),
    );
  }
}
