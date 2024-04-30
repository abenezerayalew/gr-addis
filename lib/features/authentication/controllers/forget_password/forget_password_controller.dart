import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../utils/constants/image_string.dart';
import '../../../../utils/network/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../../utils/popups/loaders.dart';
import '../../screens/password_configuration/reset_password.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  /// Variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  /// Send Reset Password EMail
  sendPasswordResetEmail() async {
    try {
      // Start Loading
      GFullScreenLoader.openLoadingDialog(
          'Processing your request...', GImages.docerAnimation);
// Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        GFullScreenLoader.stopLoading();
        return;
      }
// Form Validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        GFullScreenLoader.stopLoading();
        return;
      }
// Send Password Reset Email
      await AuthenticationRepository.instance
          .sendPasswordRestEmail(email.text.trim());

      GFullScreenLoader.stopLoading();

// Show Success Message
      GLoaders.successSnackBar(
          title: 'Email Sent',
          message:
              'A password reset email has been sent to ${email.text.trim()}. Please check your email and follow the instructions to reset your password.');
      Get.to(() => ResetPasswordScreen(email: email.text.trim()));
    } catch (e) {
      GFullScreenLoader.stopLoading();
      GLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      // Start Loading
      GFullScreenLoader.openLoadingDialog(
          'Processing your request...', GImages.docerAnimation);
// Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        GFullScreenLoader.stopLoading();
        return;
      }

// Send Password Reset Email
      await AuthenticationRepository.instance.sendPasswordRestEmail(email);

      GFullScreenLoader.stopLoading();

// Show Success Message
      GLoaders.successSnackBar(
          title: 'Email Sent',
          message:
              'A password reset email has been sent to ${email.trim()}. Please check your email and follow the instructions to reset your password.');
    } catch (e) {
      GFullScreenLoader.stopLoading();
      GLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
