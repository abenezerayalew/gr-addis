import 'package:get/get.dart';

import '../features/authentication/screens/onboarding/onboarding.dart';
import '../features/authentication/screens/password_configuration/forget_password.dart';
import '../features/authentication/screens/signin/signin.dart';
import '../features/authentication/screens/signup/signup.dart';
import '../features/authentication/screens/signup/verify_email.dart';
import '../features/core/screens/home/home.dart';
import '../features/core/screens/store/store.dart';
import 'routes.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: MyRoutes.home, page: () => const HomeScreen()),
    GetPage(name: MyRoutes.store, page: () => const StoreScreen()),
    // GetPage(name: MyRoutes.favourites, page: () => const WishListScreen()),
    // GetPage(name: MyRoutes.settings, page: () => const SettingScreen()),
    // GetPage(
    //     name: MyRoutes.productReviews,
    //     page: () => const ProductReviewsScreen()),
    // GetPage(name: MyRoutes.order, page: () => const OrderScreen()),
    // GetPage(name: MyRoutes.checkout, page: () => const CheckoutScreen()),
    // GetPage(name: MyRoutes.cart, page: () => const CartScreen()),
    // GetPage(name: MyRoutes.userProfile, page: () => const ProfileScreen()),
    // GetPage(name: MyRoutes.userAddress, page: () => const UserAddressScreen()),
    GetPage(name: MyRoutes.signup, page: () => const SignUpScreen()),
    GetPage(name: MyRoutes.verifyEmail, page: () => const VerifyEmailScreen()),
    GetPage(name: MyRoutes.signIn, page: () => const SignInScreen()),
    GetPage(name: MyRoutes.forgetPassword, page: () => const ForgetPassword()),
    GetPage(name: MyRoutes.onBoarding, page: () => const OnBoardingScreen()),
  ];
}
