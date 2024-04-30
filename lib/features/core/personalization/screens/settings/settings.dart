import '../../../../../common/widgets/list_tiles/settings_menu_tile.dart';
import '../../../../../common/widgets/list_tiles/user_profile_tile.dart';
import '../../../../../data/repositories/authentication/authentication_repository.dart';

import '/common/widgets/appbar/appbar.dart';
import '/common/widgets/custom_shapes/containers/primary_header_container.dart';
import '/common/widgets/texts/section_heading.dart';

import '/utils/constants/colors.dart';
import '/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../address/address.dart';
import '../profile/profile.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// -- Header
            GPrimaryHeaderContainer(
                child: Column(
              children: [
                /// -- AppBar
                GAppBar(
                    title: Text(
                  'Account',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .apply(color: GColors.white),
                )),
                GUserProfileTile(
                    onPressed: () => Get.to(() => const ProfileScreen())),
                const SizedBox(height: GSizes.spaceBtwItems),
              ],
            )),

            /// -- Body
            Padding(
                padding: const EdgeInsets.all(GSizes.defaultSpace),
                child: Column(
                  children: [
                    /// -- Account Settings
                    const GSectionHeading(
                        title: 'Account Settings', showActionButton: false),
                    const SizedBox(height: GSizes.spaceBtwItems),
                    GSettingsMenuTile(
                        icon: Iconsax.safe_home,
                        title: 'My Address',
                        subtitle: 'Set shopping delivery address',
                        onTap: () => Get.to(() => const UserAddressScreen())),

                    GSettingsMenuTile(
                        icon: Iconsax.bag_tick,
                        title: 'My orders',
                        subtitle: 'In progress and Completed Orders',
                        onTap: () {}),

                    GSettingsMenuTile(
                        icon: Iconsax.notification,
                        title: 'Notifications',
                        subtitle: 'Set any kind of notifications',
                        onTap: () {}),
                    GSettingsMenuTile(
                        icon: Iconsax.safe_home,
                        title: 'Account Privacy',
                        subtitle: 'Manage data usage and connected accounts',
                        onTap: () {}),

                    /// -- App Settings
                    const SizedBox(height: GSizes.spaceBtwSections),
                    const GSectionHeading(
                        title: 'App Settings', showActionButton: false),
                    const SizedBox(height: GSizes.spaceBtwItems),

                    GSettingsMenuTile(
                      icon: Iconsax.location,
                      title: 'Geolocation',
                      subtitle: 'Set recommendation based on location',
                      trailing: Switch(value: true, onChanged: (value) {}),
                    ),
                    GSettingsMenuTile(
                      icon: Iconsax.security_user,
                      title: 'Safe Mode',
                      subtitle: 'Search result is safe for all ages',
                      trailing: Switch(value: false, onChanged: (value) {}),
                    ),
                    GSettingsMenuTile(
                      icon: Iconsax.image,
                      title: 'HD Image Qulaity',
                      subtitle: 'Set image quality to be seen',
                      trailing: Switch(value: false, onChanged: (value) {}),
                    ),

                    /// -- Logout
                    const SizedBox(height: GSizes.spaceBtwSections),
                    SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                            onPressed: () =>
                                AuthenticationRepository.instance.logout(),
                            child: const Text('Logout'))),
                    const SizedBox(height: GSizes.spaceBtwSections * 2.5),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
