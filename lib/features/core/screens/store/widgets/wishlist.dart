import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_addis_v1/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/icons/my_circular_icon.dart';
import '../../../../../common/widgets/layout/grid_layout.dart';
import '../../../../../common/widgets/loaders/animation_loader.dart';
import '../../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../../navigation_menu.dart';
import '../../../../../utils/constants/image_string.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/cloud_function.dart';
import '../../../controllers/product_controller/favourites_controller.dart';
import '../../../models/product_model.dart';
import '../../home/home.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouritesController());
    return Scaffold(
        appBar: GAppBar(
            title: Text('Wishlist',
                style: Theme.of(context).textTheme.headlineMedium),
            actions: [
              GCircularIcon(icon: Iconsax.add, onPressed: () => Get.back())
            ]),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(GSizes.defaultSpace),
            child: FutureBuilder(
                future: controller.favoriteProducts(),
                builder: (context, snapshot) {
                  final emptyWidget = GAnimationLoaderWidget(
                    text: 'Whoops! Wishlist is Empty...',
                    animation: GImages.docerAnimation,
                    showAction: true,
                    actionText: 'Let\'s add some',
                    onActionPressed: () =>
                        Get.off(() => const NavigationMenu()),
                  ); // TAnimationLoaderWidget
                  const loader = GVerticalProductShimmer(itemCount: 6);
                  final widget = GCloudHelperFunctions.checkMultiRecordState(
                      snapshot: snapshot,
                      loader: loader,
                      nothingFound: emptyWidget);
                  if (widget != null) return widget;
                  final products = snapshot.data!;
                  return GGridLayout(
                      itemCount: products.length,
                      itemBuilder: (_, index) =>
                          GProductCardVertical(product: products[index]));
                }),
          ),
        ));
  }
}
