// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:green_addis_v0/repository/authentication_repository/authentication_reository.dart';
// import 'package:green_addis_v0/repository/user_repositiry/user_repository.dart';

// import '../../authentication/models/user_model.dart';

// class ProfileController extends GetxController {
//   static ProfileController get instance => Get.find();
//   final firstName = TextEditingController();
//   final lastName = TextEditingController();
//   final username = TextEditingController();
//   final email = TextEditingController();
//   final phoneNumber = TextEditingController();
//   final password = TextEditingController();

//   final _authRepo = Get.put(AuthenticationRepository());
//   final _userRepo = Get.put(UserRepository());

//   // step - 3 [Get User Email and pass to User Repository]
//   getUserData() {
//     final email = _authRepo.firebaseUser.value?.email;
//     if (email != null) {
//       return _userRepo.getUserDetails(email);
//     } else {
//       Get.snackbar("Error", "Login to continue");
//     }
//   }

//   updateRecord(UserModel user) async {
//     await _userRepo.updateUserRecord(user);
//   }
// }
