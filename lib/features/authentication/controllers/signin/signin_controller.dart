import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../utils/constants/image_string.dart';
import '../../../../utils/network/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../../utils/popups/loaders.dart';
import '../../../core/personalization/controllers/user_controller.dart';

class SignInControlller extends GetxController {
  static SignInControlller get instance => Get.find();

  /// Variables
  final hidePassword = false.obs; // observale for hiding/showing password
  final rememberMe = true.obs; // observale for tick/untick checkbox
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  // void onInit() {
  //   if (localStorage.read('REMEMBER_ME_EMAIL') != null) {
  //     email.text = localStorage.read('REMEMBER_ME_EMAIL');
  //     password.text = localStorage.read('REMEMBER_ME_PASSWORD');
  //   }

  //   super.onInit();
  // }

  /// -- Email and Password SignIn
  Future<void> emailAndPasswordSignIn() async {
    try {
// Start Loading

      GFullScreenLoader.openLoadingDialog(
          'Logging you in...', GImages.docerAnimation);
// Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        GFullScreenLoader.stopLoading();
        return;
      }
// Form Validation
      if (!signInFormKey.currentState!.validate()) {
        GFullScreenLoader.stopLoading();
        return;
      }

// Form Validation
      if (!signInFormKey.currentState!.validate()) {
        GFullScreenLoader.stopLoading();
        return;
      }

// Save Data if Remember Me is selected
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }
// Login user using EMail & Password Authentication
      await AuthenticationRepository.instance
          .signInWithEmailAndPassword(email.text.trim(), password.text.trim());
//
      GFullScreenLoader.stopLoading();
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
// Remove Loader
      GFullScreenLoader.stopLoading();
      GLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  /// -- Google SignIn Authentication
  Future<void> googleSignIn() async {
    try {
// Start Loading

      GFullScreenLoader.openLoadingDialog(
          'Logging you in...', GImages.docerAnimation);
// Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        GFullScreenLoader.stopLoading();
        return;
      }
// Google Authentication
      final userCredential =
          await AuthenticationRepository.instance.signInWithGoogle();
      await userController.saveUserRecord(userCredential);
// Redirect to Home
      GFullScreenLoader.stopLoading();
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      GFullScreenLoader.stopLoading();

      GLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
