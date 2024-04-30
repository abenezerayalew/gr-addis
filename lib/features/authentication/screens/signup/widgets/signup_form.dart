import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/validators/validation.dart';
import '../../../controllers/signup/signup_controller.dart';

import 'term_and_conditions.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpControlller());

    return Form(
        key: controller.signUpFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller.firstName,
                    validator: (value) =>
                        GValidator.validateEmptyText('First Name', value),
                    expands: false,
                    decoration: const InputDecoration(
                        labelText: GTexts.firstName,
                        prefixIcon: Icon(Iconsax.user)),
                  ),
                ),
                const SizedBox(width: GSizes.spaceBtwInputFields),
                Expanded(
                  child: TextFormField(
                    controller: controller.lastName,
                    validator: (value) =>
                        GValidator.validateEmptyText('Last Name', value),
                    expands: false,
                    decoration: const InputDecoration(
                        labelText: GTexts.lastName,
                        prefixIcon: Icon(Iconsax.user)),
                  ),
                )
              ],
            ),
            const SizedBox(height: GSizes.spaceBtwInputFields),

            /// username
            TextFormField(
              controller: controller.username,
              validator: (value) =>
                  GValidator.validateEmptyText('User Name', value),
              expands: false,
              decoration: const InputDecoration(
                  labelText: GTexts.username,
                  prefixIcon: Icon(Iconsax.user_edit)),
            ),
            const SizedBox(height: GSizes.spaceBtwInputFields),

            /// email
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: controller.email,
              validator: (value) => GValidator.validateEmail(value),
              decoration: const InputDecoration(
                  labelText: GTexts.email, prefixIcon: Icon(Iconsax.direct)),
            ),
            const SizedBox(height: GSizes.spaceBtwInputFields),

            /// phone number

            TextFormField(
              keyboardType: TextInputType.phone,
              validator: (value) => GValidator.validatePhoneNumber(value),
              controller: controller.phoneNumber,
              decoration: const InputDecoration(
                  labelText: GTexts.phoneNo, prefixIcon: Icon(Iconsax.user)),
            ),
            const SizedBox(height: GSizes.spaceBtwSections),

            /// password

            Obx(
              () => TextFormField(
                validator: (value) => GValidator.validatePassword(value),
                controller: controller.password,
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                    labelText: GTexts.password,
                    prefixIcon: const Icon(Iconsax.password_check),
                    suffixIcon: IconButton(
                        onPressed: () => controller.hidePassword.value =
                            !controller.hidePassword.value,
                        icon: Icon(controller.hidePassword.value
                            ? Iconsax.eye_slash
                            : Iconsax.eye))),
              ),
            ),
            const SizedBox(height: GSizes.spaceBtwSections),

            /// Terms & Conditions
            const TermAndConditions(),
            const SizedBox(height: GSizes.spaceBtwSections),

            /// Sign Up button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.signUp(),
                child: const Text(GTexts.createAccount),
              ),
            )
          ],
        ));
  }
}
