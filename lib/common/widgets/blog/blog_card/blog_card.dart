import '../../custom_shapes/containers/rounded_container.dart';
import '../../images/my_rounded_image.dart';
import '../../texts/blog_date_text.dart';
import '../../texts/blog_title_text.dart';
import '../../texts/my_brand_title_text_with_verified_icon.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class GBlogCardHorizontal extends StatelessWidget {
  const GBlogCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = GHelperFunctions.isDarkMode(context);

    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(GSizes.productImageRadius),
        gradient: dark
            ? GColors.linerGradientForContainerDark
            : GColors.linerGradientForContainerLight,
        // color: dark ? GColors.darkerGrey : GColors.softGrey,
      ),
      child: Row(children: [
        /// Thumbnail
        GRoundedContainer(
          height: 120,
          padding: const EdgeInsets.all(GSizes.sm),
          backgroundColor: dark ? const Color(0xFF003B3F) : GColors.white,
          child: const Stack(
            children: [
              /// Thumbnail Image
              SizedBox(
                height: 120,
                width: 120,
                child: GRoundedImage(
                    fit: BoxFit.cover,
                    imageUrl: 'assets/images/products/tomatoes.jpg',
                    applyImageRadius: true),
              ),
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
                    GBlogTitleText(
                        title: 'Solving Tomato Plant Problem', smallSize: true),
                    SizedBox(height: GSizes.spaceBtwItems / 2),
                    MyBrandTitleWithVerifiedIcon(title: 'Blog'),
                  ]),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// - Pricing
                  const Flexible(
                      child:
                          GBlogDateText(date: '12/12/2021', smallSize: true)),

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
                          Iconsax.book_1,
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
