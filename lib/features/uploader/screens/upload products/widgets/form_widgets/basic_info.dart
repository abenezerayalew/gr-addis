import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/validators/validation.dart';
import '../../../../controllers/product_upload_controller.dart';

class BasicInformation extends StatelessWidget {
  const BasicInformation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductUploadController());
    return Container(
      padding: const EdgeInsets.all(GSizes.defaultSpace),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(GSizes.borderRadiusMd),
        border: Border.all(color: Colors.grey[500]!),
      ),
      child: Column(
        children: [
          const GSectionHeading(
            title: 'Basic Information:',
            showActionButton: false,
          ),
          const SizedBox(height: GSizes.spaceBtwItems),
          Obx(() {
            if (controller.categoriesValue.value == 'Seeds') {
              return DropdownButtonFormField(
                decoration: const InputDecoration(prefixIcon: Icon(Icons.sort)),
                onChanged: (value) {
                  controller.active.value = true;
                  controller.productType = value.toString();
                },
                hint: const Text('Select Seed Type'),
                items: [
                  'Onion Seed',
                  'Tomato Seed',
                  'Lettuce Seed',
                  'spinach Seed',
                  'Cabbage Seed',
                ]
                    .map((option) =>
                        DropdownMenuItem(value: option, child: Text(option)))
                    .toList(),
              );
            } else if (controller.categoriesValue.value ==
                'Tools & Equipments') {
              return DropdownButtonFormField(
                decoration: const InputDecoration(prefixIcon: Icon(Icons.sort)),
                onChanged: (value) {
                  controller.active.value = true;
                  controller.productType = value.toString();
                },
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
              );
            } else if (controller.categoriesValue.value == 'Plants') {
              return DropdownButtonFormField(
                decoration: const InputDecoration(prefixIcon: Icon(Icons.sort)),
                onChanged: (value) {
                  controller.active.value = true;
                  controller.productType = value.toString();
                },
                hint: const Text('Select Plant Type'),
                items: [
                  'Flower',
                  'Herb',
                  'Shrub',
                ]
                    .map((option) =>
                        DropdownMenuItem(value: option, child: Text(option)))
                    .toList(),
              );
            } else if (controller.categoriesValue.value == 'Fertilizers') {
              return DropdownButtonFormField(
                decoration: const InputDecoration(prefixIcon: Icon(Icons.sort)),
                onChanged: (value) {
                  controller.active.value = true;
                  controller.productType = value.toString();
                },
                hint: const Text('Select Fertilizer Type'),
                items: [
                  'Organic',
                  'Inorganic',
                  'Liquid',
                  'Granular',
                  'Synthetic',
                ]
                    .map((option) =>
                        DropdownMenuItem(value: option, child: Text(option)))
                    .toList(),
              );
            } else if (controller.categoriesValue.value == 'Vegitables') {
              return DropdownButtonFormField(
                decoration: const InputDecoration(prefixIcon: Icon(Icons.sort)),
                onChanged: (value) {
                  controller.active.value = true;
                  controller.productType = value.toString();
                },
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
              );
            }
            return const SizedBox.shrink(
              child: Text('Select Category First'),
            );
          }

              //
              ),
          const SizedBox(height: GSizes.spaceBtwItems),
          TextFormField(
            controller: controller.productDescription,
            validator: (value) =>
                GValidator.validateEmptyText('Product Description', value),
            expands: false,
            keyboardType: TextInputType.multiline,
            maxLines: 5,
            decoration: const InputDecoration(hintText: 'Product Description'),
          ),
          const SizedBox(height: GSizes.spaceBtwItems),
        ],
      ),
    );
  }
}
