import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/styles/spacing_styles.dart';
import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../common/widgets/login_signup/social_buttons.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/helpers/helper_functions.dart';
import 'widgets/signin_form.dart';
import 'widgets/signin_header.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = GHelperFunctions.isDarkMode(context);
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          gradient: dark
              ? GColors.linerGradientBgDarkForAuth
              : GColors.linerGradientBgLightForAuth),
      child: SingleChildScrollView(
        child: Padding(
          padding: GSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              /// Logo, Title & Subtitle
              const SigninHeader(),

              /// Form
              const SignInForm(),

              /// Divider
              FormDivider(dividerText: GTexts.orSignInwith.capitalize!),
              const SizedBox(height: GSizes.spaceBtwSections),

              /// Footer
              const SocialButtons()
            ],
          ),
        ),
      ),
    ));
  }
}
