import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/validators/validation.dart';
import '../../controllers/forget_password/forget_password_controller.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controllor = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: const GAppBar(
        showBackArrow: true,
        leadingIcon: Iconsax.arrow_left,
      ),
      body: Padding(
        padding: const EdgeInsets.all(GSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Heading
            Text(
              GTexts.forgetPasswordTitle,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: GSizes.spaceBtwItems),
            Text(
              GTexts.forgetPasswordSubTitle,
              style: Theme.of(context).textTheme.labelMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: GSizes.spaceBtwSections * 2),

            ///Text field
            Form(
              key: controllor.forgetPasswordFormKey,
              child: TextFormField(
                controller: controllor.email,
                validator: GValidator.validateEmail,
                decoration: const InputDecoration(
                    labelText: GTexts.email,
                    prefixIcon: Icon(Iconsax.direct_right)),
              ),
            ),
            const SizedBox(height: GSizes.spaceBtwSections),

            ///submit button
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controllor.sendPasswordResetEmail(),
                    child: const Text(GTexts.submit))),
          ],
        ),
      ),
    );
  }
}
