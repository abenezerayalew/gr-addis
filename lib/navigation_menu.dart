import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';
import 'common/widgets/layout/layout_for_nav.dart';
import 'features/core/personalization/screens/settings/settings.dart';
import 'features/core/screens/home/home.dart';
import 'features/core/screens/store/store.dart';
import 'utils/constants/colors.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = GHelperFunctions.isDarkMode(context);
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        backgroundColor: GColors.primary,
        onPressed: () {},
        child: const Icon(Iconsax.tree, color: Colors.white),
      ),
      bottomNavigationBar: Obx(() => NavigationBar(
            height: 80,
            elevation: 0,
            selectedIndex: controller.selerctedIndex.value,
            onDestinationSelected: (index) =>
                controller.selerctedIndex.value = index,
            backgroundColor: darkMode ? GColors.darkNav : Colors.white,
            indicatorColor: Colors.transparent,
            destinations: [
              GNavigationStyle(
                  controller: controller.selerctedIndex.value == 0,
                  icon: Iconsax.home,
                  color: controller.selerctedIndex.value == 0
                      ? GColors.primary
                      : GColors.grey,
                  label: controller.selerctedIndex.value == 0 ? '' : 'Home'),
              GNavigationStyle(
                  controller: controller.selerctedIndex.value == 1,
                  icon: Iconsax.shop,
                  color: controller.selerctedIndex.value == 1
                      ? GColors.primary
                      : GColors.grey,
                  label: controller.selerctedIndex.value == 1 ? '' : 'Store'),
              GNavigationStyle(
                  controller: controller.selerctedIndex.value == 2,
                  icon: Iconsax.home,
                  color: controller.selerctedIndex.value == 2
                      ? GColors.primary
                      : GColors.grey,
                  label:
                      controller.selerctedIndex.value == 2 ? '' : 'Wishlist'),
              GNavigationStyle(
                  controller: controller.selerctedIndex.value == 3,
                  icon: Iconsax.user,
                  color: controller.selerctedIndex.value == 3
                      ? GColors.primary
                      : GColors.grey,
                  label: controller.selerctedIndex.value == 3 ? '' : 'profile'),
            ],
          )),
      body: Obx(() => controller.screens[controller.selerctedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selerctedIndex = 0.obs;
  final screens = [
    const HomeScreen(),
    const StoreScreen(),
    // const WishListScreen(),
    // const SettingScreen()
    Container(color: Colors.green),
    const SettingScreen()
  ];
}
