import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/enums.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/validators/validation.dart';
import '../../../controllers/product_upload_controller.dart';
import 'add_product_image.dart';
import 'form_widgets/basic_info.dart';
import 'form_widgets/contact_info.dart';
import 'form_widgets/product_categories_selector.dart';
import 'product_type_button_with_tilte.dart';
import 'discount_product.dart';

class ProductForm extends StatelessWidget {
  const ProductForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductUploadController());
    return Obx(
      () => Form(
        key: controller.uploadProductFormKey,
        child: Column(
          children: [
            const GProductsCategoriesSelector(),
            const SizedBox(height: GSizes.spaceBtwItems),
            ////// -- Basic Information
            const BasicInformation(),
            const SizedBox(height: GSizes.spaceBtwItems),

            /// Add Product Image
            // const AddThumbnail(),
            const SizedBox(height: GSizes.spaceBtwItems),

            const AddProductImage(),
            const SizedBox(height: GSizes.spaceBtwItems),

            const SizedBox(height: GSizes.spaceBtwSections),
            // const MyBrandCategoriesSelector(),
            const GContactInfo(),
            const SizedBox(height: GSizes.spaceBtwSections),

////// -- Stock & Pricing
            Container(
                padding: const EdgeInsets.all(GSizes.defaultSpace),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(GSizes.borderRadiusMd),
                  border: Border.all(color: Colors.grey[350]!),
                ),
                child: Column(children: [
                  const GSectionHeading(
                    title: 'Stock & Pricing:',
                    showActionButton: false,
                  ),

                  const SizedBox(height: GSizes.spaceBtwItems),
                  Obx(
                    () => TextFormField(
                      controller: controller.productStoke,
                      validator: (value) =>
                          GValidator.validateEmptyText('stock amount', value),
                      expands: false,
                      decoration: InputDecoration(
                          hintStyle: const TextStyle(color: Colors.grey),
                          labelText: 'Stock',
                          hintText: '2',
                          suffixText:
                              controller.categoriesValue.value == 'Seeds' ||
                                      controller.categoriesValue.value ==
                                          'Fertilizers' ||
                                      controller.categoriesValue.value ==
                                          'Vegitables'
                                  ? 'Kg'
                                  : '',
                          prefixIcon: const Icon(Iconsax.message_text_1)),
                    ),
                  ),
                  const SizedBox(height: GSizes.spaceBtwItems),

                  /// Product Type Button
                  const ProductTypeButtonWithTilte(),
                  const SizedBox(height: GSizes.spaceBtwItems),

                  Row(
                    children: [
                      Flexible(
                        child: TextFormField(
                          controller: controller.productprice,
                          validator: (value) => GValidator.validateEmptyText(
                              'Product Price', value),
                          expands: false,
                          decoration: const InputDecoration(
                              labelText: 'Price ',
                              prefixIcon: Icon(Iconsax.receipt_text)),
                        ),
                      ),
                      const SizedBox(width: GSizes.spaceBtwItems),
                      controller.productView.value == ProductType.variable
                          ? const DiscountProducts()
                          : const SizedBox(height: GSizes.spaceBtwSections),
                    ],
                  ),
                ])),

            const SizedBox(height: GSizes.spaceBtwItems),

            /// Save Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => controller.uploadProduct(),
                  child: const Text('Save')),
            ),
          ],
        ),
      ),
    );
  }
}
