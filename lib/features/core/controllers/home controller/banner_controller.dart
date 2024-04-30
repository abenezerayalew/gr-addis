import 'package:get/get.dart';
import '../../../../utils/constants/image_string.dart';

class BannerController extends GetxController {
  static BannerController get instance => Get.find();
  // variable
  final isLoading = false.obs;
  final carousalCurrentIndex = 0.obs;
  final bannersList = [
    {
      'imageUrl': GImages.banner1,
      'targetScreen': '/product',
    },
    {
      'imageUrl': GImages.banner1,
      'targetScreen': '/product',
    },
    {
      'imageUrl': GImages.banner1,
      'targetScreen': '/product',
    },
    // {
    //   'imageUrl': 'assets/images/products/banner4.jpg',
    //   'targetScreen': '/product',
    // },
  ].obs;
  @override
  // void onInit() {
  //   fetchBanner();
  //   super.onInit();
  // }

// Update Paage Navigation Index
  void updateCarousalIndex(int index) {
    carousalCurrentIndex.value = index;
  }

//   // Fetch Banners
//   Future<void> fetchBanner() async {
//     try {
// // Show Loader while loading categories
//       isLoading.value = true;
// // Fetch categories from data source (Firestore, API, etc.)
//       final bannerRepo = Get.put(BannerRepository());
//       final banners = await bannerRepo.fetchBanners();
// // Assign Banners
//       bannersList.assignAll(banners);
// // Filter featured categories
//     } catch (e) {
//       MyLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
//     } finally {
//       isLoading.value = false;
// //Remove Loader
//     }
  // }
}
