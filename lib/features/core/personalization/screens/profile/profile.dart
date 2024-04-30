import 'package:get/get.dart';
import '../../../../../common/widgets/shimmers/shimmer_loader.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_string.dart';
import '../../controllers/user_controller.dart';
import '/common/widgets/appbar/appbar.dart';
import '/common/widgets/images/my_circular_image.dart';
import '/common/widgets/texts/section_heading.dart';
import '/utils/constants/sizes.dart';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'widgets/change_name.dart';
import 'widgets/profile_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());

    return Scaffold(
      appBar: const GAppBar(showBackArrow: true, title: Text('Profile')),

      /// -- Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(GSizes.defaultSpace),
          child: Column(
            children: [
              /// -- Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(() {
                      final networkImage = controller.user.value.profilePicture;
                      final image = networkImage.isNotEmpty
                          ? networkImage
                          : GImages.profile;
                      return controller.imageLoading.value
                          ? const GShimmerEffect(
                              width: 80, height: 80, radius: 80)
                          : GCircularImage(
                              image: image,
                              padding: 0,
                              width: 80,
                              height: 80,
                              isNetworkImage: networkImage.isNotEmpty);
                    }),
                    TextButton(
                        onPressed: () => controller.uploadUserProfilePicture(),
                        child: const Text('Change Profile Picture',
                            style: TextStyle(color: GColors.primary)))
                  ],
                ),
              ),

              /// -- Profile Details
              const SizedBox(height: GSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: GSizes.spaceBtwItems),
              const GSectionHeading(
                  title: 'Profile Information', showActionButton: false),
              const SizedBox(height: GSizes.spaceBtwItems),
              MyProfileMenu(
                  onPressed: () => Get.to(() => const ChangeName()),
                  title: 'Name',
                  value: controller.user.value.fullName),
              MyProfileMenu(
                  onPressed: () {},
                  title: 'Username',
                  value: controller.user.value.username),

              /// -- Space
              const SizedBox(height: GSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: GSizes.spaceBtwItems),

              /// -- Heading Personal I/nfo
              const GSectionHeading(
                  title: 'Profile Information', showActionButton: false),
              const SizedBox(height: GSizes.spaceBtwItems),

              MyProfileMenu(
                  onPressed: () {},
                  title: 'User ID',
                  value: controller.user.value.id,
                  icon: Iconsax.copy),
              MyProfileMenu(
                  onPressed: () {},
                  title: 'E-mail',
                  value: controller.user.value.email),
              MyProfileMenu(
                  onPressed: () {},
                  title: 'Phone Number',
                  value: controller.user.value.phoneNumber),
              MyProfileMenu(onPressed: () {}, title: 'Gender', value: 'Male'),

              MyProfileMenu(
                  onPressed: () {},
                  title: 'Date of Birth',
                  value: '12/12/1990'),
              const Divider(),
              const SizedBox(height: GSizes.spaceBtwItems),
              Center(
                child: TextButton(
                    onPressed: () => controller.deleteAccountWarningPopup(),
                    child: const Text('Close Account',
                        style: TextStyle(color: Colors.red))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
