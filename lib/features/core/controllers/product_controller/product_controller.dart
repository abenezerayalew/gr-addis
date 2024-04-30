import 'package:get/get.dart';
import '../../../../../utils/popups/loaders.dart';
import '../../../../data/repositories/product/product_repository.dart';

import '../../models/product_model.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();
  final isLoading = false.obs;
  final _productRepository = Get.put(ProductRepository());
  RxList<ProductModel> allProducts = <ProductModel>[].obs;
  RxList<ProductModel> featuredProduct = <ProductModel>[].obs;
  RxList<ProductModel> vegetableProduct = <ProductModel>[].obs;
  RxList<ProductModel> seedProduct = <ProductModel>[].obs;
  RxList<ProductModel> toolsProduct = <ProductModel>[].obs;

  @override
  void onInit() {
    fetchProduct();
    super.onInit();
  }

  /// -- Load category data
  Future<void> fetchProduct() async {
    try {
// Show Loader while loading categories
      isLoading.value = true;
// Fetch categories from data source (Firestore, API, etc.)
      final products = await _productRepository.getAllProducts();
// Update the categories list
      allProducts.assignAll(products);
// Filter featured categories
      featuredProduct.assignAll(allProducts
          // .where((category) => category.isFeatured && category.parentId.isEmpty)
          // .take(8)
          .toList());
      vegetableProduct.assignAll(allProducts
          .where((products) => products.categoryId == 'Vegitables')
          .toList());
      seedProduct.assignAll(allProducts
          .where((products) => products.categoryId == 'Seeds')
          .toList());
      toolsProduct.assignAll(allProducts
          .where((products) => products.categoryId == 'Tools & Equipments')
          .toList());
    } catch (e) {
      GLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
//Remove Loader
    }
  }
}
