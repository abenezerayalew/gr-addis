import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_string.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../controllers/onboarding/onboarding_controller.dart';
import 'widgets/onboarding_dot_navigation.dart';
import 'widgets/onboarding_next_button.dart';
import 'widgets/onboarding_page.dart';
import 'widgets/onboarding_skip.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    final dark = GHelperFunctions.isDarkMode(context);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: dark
                ? GColors.linerGradientBgDarkForAuth
                : GColors.linerGradientBgLightForAuth),
        child: Stack(children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              /// - image
              OnBoardingPage(
                image: GImages.onboardingImage1,
                title: GTexts.onBoardingTitle1,
                subTitle: GTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: GImages.onboardingImage2,
                title: GTexts.onBoardingTitle2,
                subTitle: GTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: GImages.onboardingImage3,
                title: GTexts.onBoardingTitle3,
                subTitle: GTexts.onBoardingSubTitle3,
              ),
            ],
          ),

          /// - skip button
          const OnBoardingSkip(),

          /// - page indicator
          const OnBoardingDotNavigation(),

          /// - next button
          const OnBoardingNextButton()
        ]),
      ),
    );
  }
}
