// ProductType productView = ProductType.single;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/repositories/product/product_repository.dart';
import '../../../navigation_menu.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/constants/image_string.dart';
import '../../../utils/network/network_manager.dart';
import '../../../utils/popups/full_screen_loader.dart';
import '../../../utils/popups/loaders.dart';
import '../../core/models/product_model.dart';

class ProductUploadController extends GetxController {
  static ProductUploadController get instance => Get.find();

  final productDescription = TextEditingController();
  final productprice = TextEditingController();
  final productStoke = TextEditingController();
  final discount = TextEditingController();
  final phoneNumber = TextEditingController();
  String productType = '';
  String categoryId = '';
  String location = '';
  RxString categoriesValue = ''.obs;
  final imageLoading = false.obs;
  RxBool active = false.obs;
  String imageUrl = '';
  final _productRepository = Get.put(ProductRepository());
  Rx<ProductModel> product = ProductModel.empty().obs;
  GlobalKey<FormState> uploadProductFormKey = GlobalKey<FormState>();

  Rx<ProductType> productView = ProductType.single.obs;

  void setProductView(Set<ProductType> value) {
    productView.value = value.first;
  }

  Future<void> uploadProductImage() async {
    try {
      final image = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          imageQuality: 70,
          maxHeight: 512,
          maxWidth: 512);
      if (image != null) {
        imageLoading.value = true;
        // Upload Image
        imageUrl =
            await _productRepository.uploadProductImage('App/Products/', image);
        // Update User Image Record
        // Map<String, dynamic> json = {'Image': imageUrl};
        // await userRepository.updateSingleField(json);
        // product.value.thumbnail = imageUrl;
        product.refresh();
        GLoaders.successSnackBar(
            title: 'Category Picture Added',
            message: 'Your category picture has been added successfully.');
      }
    } catch (e) {
      GLoaders.warningSnackBar(
          title: 'Oh Snap!', message: 'something went wrong: $e');
    } finally {
      imageLoading.value = false;
    }
  }

  //

  Future<void> uploadProduct() async {
    try {
// Start Loading

      GFullScreenLoader.openLoadingDialog(
          'We are updating your information...', GImages.docerAnimation);
// Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        GFullScreenLoader.stopLoading();
        return;
      }

// Form Validation
      if (!uploadProductFormKey.currentState!.validate()) {
        GFullScreenLoader.stopLoading();
        return;
      }
      // Save  Data in Firebase Firestore
      final product = ProductModel(
        id: _productRepository.generateProductId(),
        stock: double.parse(productStoke.text),
        thumbnail: imageUrl,
        price: double.parse(productprice.text),
        productType: productType,
        discount: double.parse(discount.text),
        isVerified: false,
        categoryId: categoryId,
        description: productDescription.text,
        phoneNumber: phoneNumber.text,
        // location: location
      );
      final productRepository = Get.put(ProductRepository());
      await productRepository.saveProductData(product);

// Remove Loader
      GFullScreenLoader.stopLoading();
// Show Success Message
      GLoaders.successSnackBar(
          title: 'Congratulations',
          message: 'Category has been added successfully.');
// Move to previous screen.
      Get.offAll(() => const NavigationMenu());
    } catch (e) {
      GFullScreenLoader.stopLoading();
      GLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
