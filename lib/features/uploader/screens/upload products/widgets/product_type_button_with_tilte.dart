import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/enums.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/product_upload_controller.dart';

class ProductTypeButtonWithTilte extends StatelessWidget {
  const ProductTypeButtonWithTilte({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductUploadController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Do you offer discounts ?',
          ),
        ),
        const SizedBox(height: GSizes.spaceBtwItems),
        Obx(
          () => SegmentedButton<ProductType>(
              style: SegmentedButton.styleFrom(
                backgroundColor: Colors.transparent,
                foregroundColor: GColors.darkGrey,
                selectedForegroundColor: Colors.white,
                selectedBackgroundColor: const Color(0xFF003B3F),
              ),
              // Color(0xFF003B3F), Color(0xFF072B3B)
              segments: const <ButtonSegment<ProductType>>[
                ButtonSegment<ProductType>(
                    value: ProductType.single,
                    label: Text('No'),
                    icon: Icon(Iconsax.component)),
                ButtonSegment<ProductType>(
                    value: ProductType.variable,
                    label: Text('Yes'),
                    icon: Icon(Iconsax.discount_shape)),
              ],
              selected: <ProductType>{controller.productView.value},
              onSelectionChanged: controller.setProductView),
        ),
      ],
    );
  }
}
