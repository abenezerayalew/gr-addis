import '../../../../features/core/controllers/product_controller/product_controller.dart';
import '../../../../features/core/models/product_model.dart';
import '../../icons/my_circular_icon.dart';
import '../../images/my_rounded_image.dart';
import '../favourite_icon/favourite_icon.dart';
import '/utils/helpers/helper_functions.dart';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../custom_shapes/containers/rounded_container.dart';
import '../../texts/my_brand_title_text_with_verified_icon.dart';
import '../../texts/product_price_text.dart';
import '../../texts/product_title_text.dart';

class GProductCardVertical extends StatelessWidget {
  const GProductCardVertical({super.key, this.product});
  final ProductModel? product;
  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;

    // final salePercentage =
    //     controller.calculateSalePercentage(product.price, product.salePrice);
    final dark = GHelperFunctions.isDarkMode(context);
    return GestureDetector(
      // onTap: () => Get.to(() => ProductDetailScreen(product: product)),
      onTap: () {},
      child: Container(
        width: 200,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          border: Border.all(
              color: dark ? Colors.transparent : GColors.grey.withOpacity(0.7)),
          borderRadius: BorderRadius.circular(GSizes.productImageRadius),
          color: dark ? const Color(0xFF072B3B) : GColors.white,
          // color: dark ? GColors.darkerGrey : GColors.white,
        ),
        child: Column(
          /// -- Thumbnail image,wishlist Button , Discount Tag
          children: [
            GRoundedContainer(
              height: 180,
              width: 180,
              padding: const EdgeInsets.all(GSizes.sm),
              backgroundColor: dark ? const Color(0xFF003B3F) : GColors.light,

              // radius: MySizes.productImageRadius,
              child: Stack(
                children: [
                  /// -- Thumbnail image
                  Center(
                    child: GRoundedImage(
                        isNetworkImage: true,
                        fit: BoxFit.fill,
                        imageUrl: product!.thumbnail,
                        applyImageRadius: true),
                  ),

                  /// -- Sale Tag
                  Positioned(
                    top: 12,
                    child: GRoundedContainer(
                      radius: GSizes.sm,
                      backgroundColor: GColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: GSizes.sm, vertical: GSizes.xs),
                      child: Text('${product!.discount}%',
                          // '$salePercentage%',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .apply(color: GColors.black)),
                    ),
                  ),

                  /// -- Favourite Icon Button
                  Positioned(
                      top: 0,
                      right: 0,
                      child: GFavouriteIcon(
                        productId: product!.id,
                      ))
                ],
              ),
            ),
            const SizedBox(height: GSizes.spaceBtwItems / 2),

            /// -- Details
            Padding(
              padding: EdgeInsets.only(left: GSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GProductTitleText(
                      title: product!.productType!, smallSize: true),
                  SizedBox(height: GSizes.spaceBtwItems / 2),
                  product!.isVerified! == true
                      ? MyBrandTitleWithVerifiedIcon(
                          title: 'verified',
                        )
                      : MyBrandTitleWithVerifiedIcon(
                          title: 'not Verified',
                          iconColor: Colors.red,
                        )
                ],
              ),
            ),
            const Spacer(),

            /// - Price Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// - Price
                // Padding(
                //   padding: const EdgeInsets.only(left: MySizes.sm),
                //   child: MyProductPriceText(
                //       price: controller.getProductPrice(product)),
                // ),

                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: GSizes.sm, right: GSizes.sm),
                        child: Text(
                          product!.price.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .apply(decoration: TextDecoration.lineThrough),
                        ),
                      ),

                      /// Price, Show sale price as main price if sale exist.
                      Padding(
                        padding: const EdgeInsets.only(
                            left: GSizes.sm, right: GSizes.sm),
                        child: GProductPriceText(
                          price: (product!.price * product!.discount! / 100)
                              .toString(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: GSizes.spaceBtwItems),
          ],
        ),
      ),
    );
  }
}
