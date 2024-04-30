import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/validators/validation.dart';
import '../../../controllers/product_upload_controller.dart';

class DiscountProducts extends StatelessWidget {
  const DiscountProducts({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductUploadController());

    return Flexible(
      child: TextFormField(
        controller: controller.discount,
        validator: (value) =>
            GValidator.validateEmptyText('Product Price', value),
        expands: false,
        decoration: const InputDecoration(
            labelText: 'Discounted Price ',
            prefixIcon: Icon(Iconsax.receipt_discount)),
      ),
    );
  }
}
