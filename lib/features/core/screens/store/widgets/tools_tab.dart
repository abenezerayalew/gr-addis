import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/layout/grid_layout.dart';
import '../../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:flutter/material.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/product_controller/product_controller.dart';
import '../../../models/product_model.dart';
import 'price_filter.dart';

class GToolTab extends StatelessWidget {
  const GToolTab({
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
                hint: const Text('Select Tools Type'),
                items: [
                  'Hoe',
                  'Rake',
                  'Shovel',
                  'Spade',
                  'Trowel',
                ]
                    .map((option) =>
                        DropdownMenuItem(value: option, child: Text(option)))
                    .toList(),
              ),
              const SizedBox(height: GSizes.spaceBtwItems),
              const PriceFilter(),

///// for testing purposes
              GGridLayout(
                  itemCount: controller.toolsProduct.length,
                  itemBuilder: (_, index) => GProductCardVertical(
                        product: controller.toolsProduct[index],
                      )),
              const SizedBox(height: GSizes.spaceBtwItems),
            ])),
      ],
    );
  }
}
