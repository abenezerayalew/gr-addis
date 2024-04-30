import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../data/repositories/user/user_repository.dart';
import '../../../../utils/constants/image_string.dart';
import '../../../../utils/network/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../../utils/popups/loaders.dart';
import '../../models/user_model.dart';
import '../../screens/signup/verify_email.dart';

class SignUpControlller extends GetxController {
  static SignUpControlller get instance => Get.find();

  /// Variables
  final hidePassword = true.obs; // observale for hiding/showing password
  final privacyPolicy = true.obs; // observale for tick/untick checkbox

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  /// SIGN UP
  void signUp() async {
    try {
      // Start Loading
      GFullScreenLoader.openLoadingDialog(
          'We are processing your information ...', GImages.docerAnimation);
      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        GFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!signUpFormKey.currentState!.validate()) {
        GFullScreenLoader.stopLoading();
        return;
      }

      // Privacy Policy check
      if (!privacyPolicy.value) {
        GLoaders.warningSnackBar(
            title: 'Accept Privacy Policy',
            message:
                'In order to create account, you must have to read and accept the privacy policy and Terms of use.');
        return;
      }
      // Register User in the Firebase Authentication And Save User Data in Firestore
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());
      // Save Authenticated User Data in Firebase Firestore

      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        username: username.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );
      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);
      // Stop Loading
      GFullScreenLoader.stopLoading();

      // Show Success Message
      GLoaders.successSnackBar(
          title: 'Congratulations',
          message:
              'Your account has been created! Verify your email to continue.');
      // Move to verification Email screen
      Get.to(() => VerifyEmailScreen(email: email.text.trim()));
    } catch (e) {
      GFullScreenLoader.stopLoading();
      GLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
    // finally {
    //   MyFullScreenLoader.stopLoading();
    // }
  }
}
