import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../../controllers/onboarding/onboarding_controller.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Obx(() => Positioned(
          bottom: GDeviceUtils.getBottomNavigationBarHeight() + 25,
          left: GSizes.defaultSpace,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (int i = 0; i < 3; i++)
                GCircularContainer(
                  width: controller.currentPageIndex.value == i ? 20 * 2.5 : 20,
                  height: 4,
                  margin: const EdgeInsets.only(right: 10),
                  backgroundColor: controller.currentPageIndex.value == i
                      ? GColors.secondary
                      : GColors.grey,
                )
            ],
          ),
        ));
  }
}
