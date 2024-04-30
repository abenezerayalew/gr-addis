import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../data/repositories/categories/category_repository.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../controllers/product_upload_controller.dart';

class GProductsCategoriesSelector extends StatelessWidget {
  const GProductsCategoriesSelector({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryRepository());
    final controllerForCat = Get.put(ProductUploadController());

    return Container(
      padding: const EdgeInsets.all(GSizes.defaultSpace),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(GSizes.borderRadiusMd),
        border: Border.all(color: Colors.grey[350]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Categories:'),
          const SizedBox(height: GSizes.spaceBtwSections),

          /// Dropdown
          Obx(
            () => IgnorePointer(
              ignoring: controllerForCat.active.value,
              child: DropdownButtonFormField(
                decoration:
                    const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
                onChanged: (values) {
                  controllerForCat.categoriesValue.value = values.toString();
                  controllerForCat.categoryId = values.toString();
                },
                hint: const Text('Select Category'),
                items: [
                  'Vegitables',
                  'Seeds',
                  'Tools & Equipments',
                  'Fertilizers',
                  'Plants',
                ]
                    .map((option) =>
                        DropdownMenuItem(value: option, child: Text(option)))
                    .toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
