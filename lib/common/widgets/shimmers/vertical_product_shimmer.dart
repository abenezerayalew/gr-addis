import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';
import '../layout/grid_layout.dart';
import 'shimmer_loader.dart';

class GVerticalProductShimmer extends StatelessWidget {
  const GVerticalProductShimmer({
    super.key,
    this.itemCount = 4,
  });
  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return GGridLayout(
      itemCount: itemCount,
      itemBuilder: (_, __) => const SizedBox(
        width: 180,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          /// Image
          GShimmerEffect(width: 180, height: 180),
          SizedBox(height: GSizes.spaceBtwItems),

          /// Text
          GShimmerEffect(width: 160, height: 15),
          SizedBox(height: GSizes.spaceBtwItems / 2),
          GShimmerEffect(width: 110, height: 15),
        ]),
      ),
    );
  }
}
