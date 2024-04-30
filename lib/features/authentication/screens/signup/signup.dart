import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '/common/widgets/login_signup/social_buttons.dart';

import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import 'widgets/signup_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = GHelperFunctions.isDarkMode(context);
    return Scaffold(
        appBar: GAppBar(
          leadingIcon: Iconsax.arrow_left,
          showBackArrow: true,
          backgroundColor: dark ? const Color(0xFF013C40) : Colors.transparent,
        ),
        //dark? GColors.linerGradientBgDarkForAuth:GColors.linerGradientBgLightForAuth
        body: Container(
          decoration: BoxDecoration(
              gradient: dark
                  ? GColors.linerGradientBgDarkForAuth
                  : GColors.linerGradientBgLightForAuth),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(GSizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Title
                  Text(GTexts.signUpTitle,
                      style: Theme.of(context).textTheme.headlineMedium),
                  const SizedBox(height: GSizes.spaceBtwSections),

                  /// Form
                  const SignUpForm(),
                  const SizedBox(height: GSizes.spaceBtwSections),

                  /// Divider
                  FormDivider(
                    dividerText: GTexts.orSignInwith.capitalize!,
                  ),
                  const SizedBox(height: GSizes.spaceBtwSections),

                  /// Social Buttons
                  const SocialButtons(),
                  const SizedBox(height: GSizes.spaceBtwSections),
                ],
              ),
            ),
          ),
        ));
  }
}
