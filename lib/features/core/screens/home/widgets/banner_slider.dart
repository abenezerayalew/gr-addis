import 'package:carousel_slider/carousel_slider.dart';
import '../../../controllers/home controller/banner_controller.dart';
import '/common/widgets/custom_shapes/containers/circular_container.dart';

import '/utils/constants/sizes.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/images/my_rounded_image.dart';
import '../../../../../utils/constants/colors.dart';

class GBannerSlider extends StatelessWidget {
  const GBannerSlider({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return Obx(() => Column(
          children: [
            CarouselSlider(
              carouselController: CarouselController(),
              options: CarouselOptions(
                height: 120,
                viewportFraction: 1,
                onPageChanged: (index, _) =>
                    controller.updateCarousalIndex(index),
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
              ),
              items: controller.bannersList
                  .map(
                    (banner) => GRoundedImage(
                      backgroundColor: const Color(0xFF003B3F),
                      width: double.infinity,
                      imageUrl: banner['imageUrl'] ?? '',
                      isNetworkImage: false,
                      onPressed: () => Get.toNamed(banner['targetScreen']!),
                      fit: BoxFit.fill,
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: GSizes.spaceBtwSections),
            Obx(
              () => Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (int i = 0; i < controller.bannersList.length; i++)
                    GCircularContainer(
                      width: controller.carousalCurrentIndex.value == i
                          ? 20 * 2.5
                          : 20,
                      height: 4,
                      margin: const EdgeInsets.only(right: 10),
                      backgroundColor:
                          controller.carousalCurrentIndex.value == i
                              // ? MyColors.primary
                              ? GColors.secondary
                              : GColors.grey,
                    )
                ],
              ),
            )
          ],
        ));
  }
}
