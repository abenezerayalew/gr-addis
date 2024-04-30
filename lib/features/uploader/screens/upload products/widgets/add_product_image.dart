import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../common/widgets/images/my_circular_image.dart';
import '../../../../../common/widgets/shimmers/shimmer_loader.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_string.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/product_upload_controller.dart';

// ignore: must_be_immutable
class AddProductImage extends StatefulWidget {
  const AddProductImage({super.key});

  @override
  State<AddProductImage> createState() => _AddProductImageState();
}

class _AddProductImageState extends State<AddProductImage> {
  List<File> imageList = [];

  void sellProduct() {
    // if (_addProductFormKey.currentState!.validate() && images.isNotEmpty) {
    //   shopServices.sellProduct(
    //     context: context,
    //     name: productNameController.text,
    //     description: descriptionController.text,
    //     price: double.parse(priceController.text),
    //     quantity: double.parse(quantityController.text),
    //     category: category,
    //     images: images,
    // );
    // }
  }

  void selectImages() async {
    // var res = await MyHelperFunctions.pickImages();
    // setState(() {
    //   imageList = res;
    // });
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductUploadController());
    return Container(
      padding: const EdgeInsets.all(GSizes.defaultSpace),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(GSizes.borderRadiusMd),
        border: Border.all(color: Colors.grey[500]!),
      ),
      child: Column(
        children: [
          const GSectionHeading(
            title: 'Add Product Images',
            showActionButton: false,
          ),
          const SizedBox(height: GSizes.spaceBtwItems / 2),
          GestureDetector(
            onTap: selectImages,
            child: Padding(
              padding: const EdgeInsets.all(GSizes.defaultSpace / 4),
              child: Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[500]!),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // const Icon(
                    //   Iconsax.image,
                    //   size: 40,
                    // ),
                    const SizedBox(height: 15),
                    Text(
                      'Add Additional Product Images',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey.shade400,
                      ),
                    ),
                    Obx(() {
                      final networkImage = controller.product.value.thumbnail;
                      final image = networkImage.isNotEmpty
                          ? networkImage
                          : GImages.addIcon;
                      return controller.imageLoading.value
                          ? const GShimmerEffect(
                              width: 80, height: 80, radius: 80)
                          : GCircularImage(
                              image: image,
                              padding: GSizes.xl,
                              border: true,
                              // backgroundColor: true,
                              overlayColor: GColors.darkGrey,
                              fit: BoxFit.fill,
                              isNetworkImage: networkImage.isNotEmpty,
                              onTap: () => controller.uploadProductImage());
                    }),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: GSizes.spaceBtwItems),
          // Row(
          //   children: [
          //     Expanded(
          //       flex: 4,
          //       child: SizedBox(
          //         height: 100,
          //         child: ListView.separated(
          //             separatorBuilder: (context, _) =>
          //                 const SizedBox(width: GSizes.spaceBtwItems),
          //             scrollDirection: Axis.horizontal,
          //             shrinkWrap: true,
          //             itemCount: 8,
          //             itemBuilder: (context, _) => GRoundedContainer(
          //                 height: 100,
          //                 padding:
          //                     const EdgeInsets.all(GSizes.defaultSpace / 2),
          //                 child: Image.asset(GImages.weatherIcon))),
          //       ),
          //     ),
          //     const Spacer(),
          //     Expanded(
          //       flex: 2,
          //       child: SizedBox(
          //         height: 100,
          //         child: OutlinedButton(
          //             onPressed: () {}, child: const Icon(Icons.add)),
          //       ),
          //     )
          //   ],
          // )
        ],
      ),
    );
  }
}
// imageList.isNotEmpty
//                         ? CarouselSlider(
//                             items: imageList.map(
//                               (file) {
//                                 return Builder(
//                                   builder: (BuildContext context) => Image.file(
//                                     file,
//                                     fit: BoxFit.cover,
//                                     height: 200,
//                                   ),
//                                 );
//                               },
//                             ).toList(),
//                             options: CarouselOptions(
//                               viewportFraction: 0.8,
//                               height: 200,
//                             ),
//                           )
//                         : const SizedBox.shrink()