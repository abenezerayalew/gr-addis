import 'package:get/get.dart';

import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../common/widgets/shimmers/category_shimmer.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../controllers/product_controller/product_controller.dart';
import '/utils/constants/sizes.dart';

import 'package:flutter/material.dart';

import 'widgets/explore_blog.dart';
import 'widgets/home_appbar.dart';
import 'widgets/banner_slider.dart';
import 'widgets/weather_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          const GPrimaryHeaderContainer(
            child: Column(
              children: [
                // -- AppBar
                GHomeAppBar(),
                SizedBox(height: GSizes.spaceBtwSections),
                // -- Weather
                Padding(
                  padding: EdgeInsets.only(
                      left: GSizes.defaultSpace, right: GSizes.defaultSpace),
                  child: Column(
                    children: [
                      WeatherContainer(),
                      SizedBox(height: GSizes.spaceBtwSections),
                    ],
                  ),
                ),
                SizedBox(height: GSizes.spaceBtwSections),
              ],
            ),
          ),

          // -- Body
          Padding(
              padding: const EdgeInsets.all(GSizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// -- Blog
                  GSectionHeading(title: 'Explore Blog', onPressed: () {}),
                  const SizedBox(height: GSizes.spaceBtwItems),
                  const ExploreBlog(),
                  const SizedBox(height: GSizes.spaceBtwItems * 5),
                  const GBannerSlider(),
                  const SizedBox(height: GSizes.spaceBtwItems * 5),

                  // /// --
                  // Obx(() {
                  //   if (controller.isLoading.value)
                  //     return const GCategoryShimmer();
                  //   if (controller.featuredProduct.isEmpty) {
                  //     return Center(
                  //         child: Text('No data found',
                  //             style: Theme.of(context)
                  //                 .textTheme
                  //                 .bodyMedium!
                  //                 .apply(color: Colors.white)));
                  //   }
                  //   return SizedBox(
                  //       height: 200,
                  //       child: ListView.builder(
                  //           shrinkWrap: true,
                  //           itemCount: controller.featuredProduct.length,
                  //           scrollDirection: Axis.vertical,
                  //           itemBuilder: (_, index) {
                  //             return GProductCardVertical(
                  //               product: controller.featuredProduct[index],
                  //             );
                  //           }));
                  // })
                ],
              ))
        ],
      ),
    ));
  }
}
