import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../features/core/models/category_model.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;

  /// Get all categories

  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection('Categories').get();
      final list = snapshot.docs
          .map((document) => CategoryModel.fromSnapshot(document))
          .toList();
      return list;
    } on FirebaseException catch (e) {
      throw GFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw GPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<String> getSingleCategoryFromFirestore() async {
    final snapshot = _db.collection('Categories');
    final documentSnapshot =
        await snapshot.doc(generateCategoryId as String?).get();

    if (documentSnapshot.exists) {
      print('=================Document does  exist==============');
      return documentSnapshot.data()!['Name'];
    } else {
      print('Document does not exist');
      return '';
    }
  }
// Future<String> getSingleFieldFromFirestore(String collectionName, String documentId, String fieldName) async {
//   final firestore = FirebaseFirestore.instance;
//   final collectionRef = firestore.collection(collectionName);
//   final documentSnapshot = await collectionRef.doc(documentId).get();

//   if (documentSnapshot.exists) {
//     return documentSnapshot.data()[fieldName] as String; // Assuming field is a String
//   } else {
//     print('Document does not exist');
//     return ''; // Or handle the case where the document is not found
//   }
// }

  /// Get Sub Categories

  /// Function to Upload any Image
  // Future<String> uploadcategoryImage(String path, XFile image) async {
  //   try {
  //     final ref = FirebaseStorage.instance.ref(path).child(image.name);
  //     await ref.putFile(File(image.path));
  //     final url = await ref.getDownloadURL();
  //     return url;
  //   } on FirebaseException catch (e) {
  //     throw GFirebaseException(e.code).message;
  //   } on FormatException catch (_) {
  //     throw const GFormatException();
  //   } on PlatformException catch (e) {
  //     throw GPlatformException(e.code).message;
  //   } catch (e) {
  //     throw 'Something went wrong. Please try again';
  //   }
  // }

  /// Function to save user data to Firestore.
  Future<void> savecategoryData(CategoryModel category) async {
    try {
      await _db
          .collection("Categories")
          .doc(category.id)
          .set(category.toJson());
    } on FirebaseException catch (e) {
      GFirebaseException(e.code).message;
    } on FormatException catch (_) {
      const GFormatException();
    } on PlatformException catch (e) {
      GPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Function to generate a unique category ID
  String generateCategoryId() {
    return _db.collection("Categories").doc().id;
  }
}
