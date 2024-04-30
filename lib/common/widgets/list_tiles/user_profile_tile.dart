import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../features/core/personalization/controllers/user_controller.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_string.dart';
import '../images/my_circular_image.dart';
import '../shimmers/shimmer_loader.dart';

class GUserProfileTile extends StatelessWidget {
  const GUserProfileTile({super.key, required this.onPressed});
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return ListTile(
        leading: Obx(() {
          final networkImage = controller.user.value.profilePicture;
          final image =
              networkImage.isNotEmpty ? networkImage : GImages.profile;
          return controller.imageLoading.value
              ? const GShimmerEffect(width: 80, height: 80, radius: 80)
              : GCircularImage(
                  image: image,
                  padding: 0,
                  width: 50,
                  height: 50,
                  isNetworkImage: networkImage.isNotEmpty);
        }),
        //  const GCircularImage(
        // image: GImages.profile, width: 50, height: 50, padding: 0),
        title: Text(
          controller.user.value.fullName,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: GColors.white),
        ),
        subtitle: Text(
          controller.user.value.email,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .apply(color: GColors.white),
        ),
        trailing: IconButton(
            icon: const Icon(Iconsax.edit, color: GColors.white),
            onPressed: onPressed));
  }
}
