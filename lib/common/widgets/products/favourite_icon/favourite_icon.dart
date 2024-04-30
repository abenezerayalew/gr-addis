import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/features/core/controllers/product_controller/favourites_controller.dart';
import 'package:iconsax/iconsax.dart';

import '../../icons/my_circular_icon.dart';

class GFavouriteIcon extends StatelessWidget {
  const GFavouriteIcon({super.key, required this.productId});
  final String productId;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouritesController());
    return Obx(
      () => GCircularIcon(
        icon:
            controller.isFavourite(productId) ? Iconsax.heart5 : Iconsax.heart,
        color: controller.isFavourite(productId) ? Colors.red : null,
        onPressed: () => controller.toggleFavoriteProduct(productId),
      ),
    );
  }
}
