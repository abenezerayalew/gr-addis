import '../../../../utils/constants/image_string.dart';
import '/common/widgets/texts/product_price_text.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../custom_shapes/containers/rounded_container.dart';
import '../../icons/my_circular_icon.dart';
import '../../images/my_rounded_image.dart';
import '../../texts/my_brand_title_text_with_verified_icon.dart';
import '../../texts/product_title_text.dart';

class GProductCardHorizontal extends StatelessWidget {
  const GProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = GHelperFunctions.isDarkMode(context);

    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(GSizes.productImageRadius),
        color: dark ? GColors.darkerGrey : GColors.softGrey,
      ),
      child: Row(children: [
        /// Thumbnail
        GRoundedContainer(
          height: 120,
          padding: const EdgeInsets.all(GSizes.sm),
          backgroundColor: dark ? GColors.dark : GColors.white,
          child: Stack(
            children: [
              /// Thumbnail Image
              const SizedBox(
                height: 120,
                width: 120,
                child: GRoundedImage(
                    imageUrl: GImages.product1, applyImageRadius: true),
              ),
// -- Sale Tag
              Positioned(
                top: 12,
                child: GRoundedContainer(
                  radius: GSizes.sm,
                  backgroundColor: GColors.secondary.withOpacity(0.8),
                  padding: const EdgeInsets.symmetric(
                      horizontal: GSizes.sm, vertical: GSizes.xs),
                  child: Text('25%',
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .apply(color: GColors.black)),
                ), // TRoundedContainer
              ),

              /// -- Favourite Icon Button
              const Positioned(
                top: 0,
                right: 0,
                child: GCircularIcon(icon: Iconsax.heart5, color: Colors.red),
              )
            ],
          ),
        ),

        /// - Details

        SizedBox(
          width: 172,
          child: Padding(
            padding: const EdgeInsets.only(left: GSizes.sm, top: GSizes.sm),
            child: Column(children: [
              const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GProductTitleText(
                        title: 'Green Nike Half Sleeves Shirt',
                        smallSize: true),
                    SizedBox(height: GSizes.spaceBtwItems / 2),
                    MyBrandTitleWithVerifiedIcon(title: 'Nike'),
                  ]),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// - Pricing
                  const Flexible(child: GProductPriceText(price: '256.0')),

                  /// - Add to cart Button
                  Container(
                    decoration: const BoxDecoration(
                        color: GColors.dark,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(GSizes.cardRadiusMd),
                            bottomRight:
                                Radius.circular(GSizes.productImageRadius))),
                    child: const SizedBox(
                      width: GSizes.iconLg * 1.2,
                      height: GSizes.iconLg * 1.2,
                      child: Center(
                        child: Icon(
                          Iconsax.add,
                          color: GColors.white,
                        ),
                      ),
                    ),
                  )
                ],
              )
            ]),
          ),
        )
      ]),
    );
  }
}
