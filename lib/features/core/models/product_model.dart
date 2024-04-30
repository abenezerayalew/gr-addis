import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  String id;
  double stock;
  double price;
  String? productType;
  // String? location;
  // DateTime? date;
  double? discount;
  String thumbnail;
  String phoneNumber;
  bool? isVerified;
  String? description;
  String? categoryId;
  // double? rating;
  ProductModel({
    required this.id,
    required this.stock,
    required this.thumbnail,
    required this.price,
    required this.phoneNumber,
    this.productType,
    // this.rating,
    // this.date,
    this.discount = 0.0,
    this.isVerified,
    this.description,
    // this.location,
    this.categoryId,
  });

  /// Create Empty func for clean code
  static ProductModel empty() => ProductModel(
        id: '',
        stock: 0,
        thumbnail: '',
        price: 0,
        discount: 0,
        productType: 'vegetable',
        phoneNumber: '',
        // rating: 0,
        isVerified: false,
      );

  /// json format
  Map<String, dynamic> toJson() {
    return {
      'ProductType': productType,
      'Stock': stock,
      'Price': price,
      'Thumbnail': thumbnail,
      'Discount': discount,
      // 'Location': location ?? '',
      'IsVerified': isVerified,
      'CategoryId': categoryId,
      'Description': description,
      'PhoneNumber': phoneNumber,
      // 'Rating': rating,
    };
  }

  /// Map Json oriented document snapshot from Firebase to Model

  factory ProductModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;

      return ProductModel(
        id: document.id,
        productType: data['ProductType'] ?? '',
        stock: data['Stock'] ?? 0,
        // location: data['Location'] ?? '',
        isVerified: data['IsVerified'] ?? false,
        price: double.parse((data['Price'] ?? 0.0).toString()),
        discount: double.parse((data['Discount'] ?? 0.0).toString()),
        thumbnail: data['Thumbnail'] ?? '',
        categoryId: data['CategoryId'] ?? '',
        description: data['Description'] ?? '',
        phoneNumber: data['PhoneNumber'] ?? '',
        // rating: data['Rating'] ?? '',
      );
    } else {
      return ProductModel.empty();
    }
  }
}
