// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../../../../../common/widgets/images/my_circular_image.dart';
// import '../../../../../../common/widgets/shimmers/shimmer_loader.dart';
// import '../../../../../../utils/constants/colors.dart';
// import '../../../../../../utils/constants/image_string.dart';
// import '../../../../../../utils/constants/sizes.dart';
// import '../../../../controllers/upload_banner_controller.dart';

// class AddThumbnail extends StatelessWidget {
//   const AddThumbnail({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(UploadBannersController());
//     return Container(
//       padding: const EdgeInsets.all(GSizes.defaultSpace),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(GSizes.borderRadiusMd),
//         border: Border.all(color: Colors.grey[350]!),
//       ),
//       child: Column(
//         children: [
//           const Text('Product Thumbnail'),
//           const SizedBox(height: GSizes.spaceBtwItems),
//           Obx(() {
//             final networkImage = controller.banner.value.imageUrl;
//             final image =
//                 networkImage.isNotEmpty ? networkImage : GImages.product1;
//             return controller.imageLoading.value
//                 ? const GShimmerEffect(width: 80, height: 80, radius: 80)
//                 : GCircularImage(
//                     enableCachNetworkImage: false,
//                     image: image,
//                     padding: GSizes.xl,
//                     overlayColor: GColors.darkGrey,
//                     fit: BoxFit.fill,
//                     width: 180,
//                     height: 180,
//                     backgroundColor: true,
//                     isNetworkImage: networkImage.isNotEmpty,
//                     onTap: () => controller.uploadBannerImage());
//           }),
//           const SizedBox(height: GSizes.spaceBtwItems),
//           SizedBox(
//               width: double.infinity,
//               child: OutlinedButton(
//                   onPressed: () {}, child: const Text('Add Thumbnail')))
//         ],
//       ),
//     );
//   }
// }
