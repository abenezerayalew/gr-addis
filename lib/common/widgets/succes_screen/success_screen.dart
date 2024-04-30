import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../features/authentication/screens/signin/signin.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/text_strings.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../../styles/spacing_styles.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen(
      {super.key,
      this.title,
      this.image,
      this.subTitle,
      this.onPressed,
      this.lottie = false});
  final String? title, image, subTitle;
  final bool lottie;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    final dark = GHelperFunctions.isDarkMode(context);
    return Scaffold(
        body: Container(
      height: double.infinity,
      decoration: BoxDecoration(
          gradient: dark
              ? GColors.linerGradientBgDarkForAuth
              : GColors.linerGradientBgLightForAuth),
      child: SingleChildScrollView(
        child: Padding(
          padding: GSpacingStyle.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
              /// Image
              Lottie.asset(image!, width: GHelperFunctions.screenWidth() * 0.6),

              const SizedBox(height: GSizes.spaceBtwSections),

              /// Title & Subtitle
              Text(
                title!,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: GSizes.spaceBtwItems),
              Text(
                subTitle!,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: GSizes.spaceBtwSections),

              /// Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => Get.to(() => const SignInScreen()),
                    child: const Text(GTexts.continueto)),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
