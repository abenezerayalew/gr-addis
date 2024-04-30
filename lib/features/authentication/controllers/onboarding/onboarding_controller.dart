import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../screens/signin/signin.dart';

// import '../../screens/login/login.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  ///Variable to store current page index
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  /// Update current  index when page scroll
  void updatePageIndicator(int index) => currentPageIndex.value = index;

  /// jump to the specific dot selected page
  void dotNavigationClick(int index) {
    currentPageIndex.value = index;
    pageController.jumpToPage(index);
    // pageController.animateToPage(index,
    //     duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
  }

  /// Update current  index & jump to next page
  void nextPage() {
    if (currentPageIndex.value == 2) {
      final storage = GetStorage();
      if (kDebugMode) {
        print('=============== GET STORAGE Next Button=============');
        print(storage.read('IsFirstTime'));
      }
      storage.write('IsFirstTime', false);
      if (kDebugMode) {
        print('=============== GET STORAGE Next Button=============');
        print(storage.read('IsFirstTime'));
      }
      Get.offAll(() => const SignInScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  /// Update current  index & jump to the last page
  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }
}
