import 'package:get/get.dart';

import '../../../../../common/widgets/layout/grid_layout.dart';
import '../../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:flutter/material.dart';
import '../../../../../common/widgets/shimmers/category_shimmer.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/product_controller/product_controller.dart';
import '../../../models/product_model.dart';
import 'price_filter.dart';

class GVegetablesTab extends StatelessWidget {
  const GVegetablesTab({
    super.key,
  });

  // final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return ListView(
      shrinkWrap: true,
      // physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
            padding: const EdgeInsets.all(GSizes.defaultSpace),
            child: Column(children: [
              /// -- category type
              DropdownButtonFormField(
                decoration: const InputDecoration(prefixIcon: Icon(Icons.sort)),
                onChanged: (value) {},
                hint: const Text('Select Vegetable Type'),
                items: [
                  'Onion',
                  'Tomato',
                  'Lettuce',
                  'spinach',
                  'Cabbage',
                ]
                    .map((option) =>
                        DropdownMenuItem(value: option, child: Text(option)))
                    .toList(),
              ),
              const SizedBox(height: GSizes.spaceBtwItems),
              const PriceFilter(),

///// for testing purposes
              Obx(() {
                if (controller.isLoading.value) return const GCategoryShimmer();
                if (controller.vegetableProduct.isEmpty) {
                  return Center(
                      child: Text('No data found',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .apply(color: Colors.white)));
                }
                return GGridLayout(
                    itemCount: controller.vegetableProduct.length,
                    itemBuilder: (_, index) => GProductCardVertical(
                          product: controller.vegetableProduct[index],
                        ));
              }),
              const SizedBox(height: GSizes.spaceBtwItems),
            ])),
      ],
    );
  }
}
