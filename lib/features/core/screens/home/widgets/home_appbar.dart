import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_addis_v1/utils/helpers/helper_functions.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/text_strings.dart';
import '../../../../../app.dart';
import '../../../../../common/widgets/shimmers/shimmer_loader.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../personalization/controllers/user_controller.dart';

class GHomeAppBar extends StatefulWidget {
  const GHomeAppBar({
    super.key,
  });

  @override
  State<GHomeAppBar> createState() => _GHomeAppBarState();
}

class _GHomeAppBarState extends State<GHomeAppBar> {
  bool light0 = true;
  final MaterialStateProperty<Icon?> thumbIcon =
      MaterialStateProperty.resolveWith<Icon?>(
    (Set<MaterialState> states) {
      // Thumb icon when the switch is selected.
      if (states.contains(MaterialState.selected)) {
        return const Icon(
          Icons.mode_night_outlined,
          color: Colors.white,
        );
      }
      return const Icon(
        Icons.light_mode_outlined,
        color: Colors.yellow,
      );
    },
  );
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    final dark = GHelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.only(top: GSizes.defaultSpace * 2),
      child: ListTile(
          title: Obx(() {
            if (controller.profileLoading.value) {
              return const GShimmerEffect(width: 80, height: 15);
            } else {
              return Text(
                'Selam, ${controller.user.value.fullName}',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .apply(color: GColors.grey),
              );
            }
          }),
          subtitle: Text(
            GTexts.homeAppbarTitle,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: GColors.grey),
          ),
          //
          trailing: Switch(
            activeTrackColor: GColors.darkGrey,
            inactiveTrackColor: const Color(0xFFF5F5F5),
            thumbColor: MaterialStateProperty.all(const Color(0xFF252525)),
            thumbIcon: thumbIcon,
            value: light0,
            onChanged: (bool value) {
              setState(() {
                light0 = value;
                GApp.themeNotifier.value =
                    GApp.themeNotifier.value == ThemeMode.light
                        ? ThemeMode.dark
                        : ThemeMode.light;
              });
            },
          )),
    );
  }
}
