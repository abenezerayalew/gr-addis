import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../features/authentication/controllers/signin/signin_controller.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_string.dart';
import '/utils/helpers/helper_functions.dart';
import '../../../../utils/constants/sizes.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = GHelperFunctions.isDarkMode(context);
    final controller = Get.put(SignInControlller());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: dark ? GColors.darkGrey : GColors.grey,
            ),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () => controller.googleSignIn(),
            icon: const Image(
              width: GSizes.iconMd,
              height: GSizes.iconMd,
              image: AssetImage(GImages.googleLogo),
            ),
          ),
        ),
        const SizedBox(width: GSizes.spaceBtwItems),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: dark ? GColors.darkGrey : GColors.grey,
            ),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
              width: GSizes.iconMd,
              height: GSizes.iconMd,
              image: AssetImage(GImages.mobileOTP),
            ),
          ),
        )
      ],
    );
  }
}
