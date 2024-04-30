import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../utils/constants/text_strings.dart';
import '../../../../../../utils/validators/validation.dart';
import '/features/uploader/controllers/product_upload_controller.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../utils/constants/sizes.dart';

class GContactInfo extends StatelessWidget {
  const GContactInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductUploadController());
    return Container(
      padding: const EdgeInsets.all(GSizes.defaultSpace),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(GSizes.borderRadiusMd),
        border: Border.all(color: Colors.grey[350]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Contact & Location:'),
          const SizedBox(height: GSizes.spaceBtwSections),

          /// Dropdown
          DropdownButtonFormField(
            decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
            onChanged: (values) {
              controller.location = values.toString();
            },
            hint: const Text('Select Location'),
            items: [
              'Addis Ketema',
              'Akaki Kality',
              'Arada',
              'Bole',
              'Gullele',
              'Kirkos',
              'Kolfe Keranio',
              'Lideta',
              'Nifas Silk-Lafto',
              'Yeka',
            ]
                .map((option) =>
                    DropdownMenuItem(value: option, child: Text(option)))
                .toList(),
          ),
          const SizedBox(height: GSizes.spaceBtwSections),
          TextFormField(
            keyboardType: TextInputType.phone,
            validator: (value) => GValidator.validatePhoneNumber(value),
            controller: controller.phoneNumber,
            decoration: const InputDecoration(
                labelText: GTexts.phoneNo, prefixIcon: Icon(Iconsax.user)),
          ),
        ],
      ),
    );
  }
}
