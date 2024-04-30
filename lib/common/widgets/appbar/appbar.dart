import '/utils/constants/colors.dart';
import '/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/device/device_utility.dart';

class GAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GAppBar(
      {super.key,
      this.title,
      this.backgroundColor = Colors.transparent,
      this.showBackArrow = false,
      this.leadingIcon,
      this.actions,
      this.leadingOnPressed,
      this.centerTitle,
      this.bottom});
  final Widget? title;
  final bool showBackArrow;
  final Color? backgroundColor;
  final bool? centerTitle;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;
  final PreferredSizeWidget? bottom;
  @override
  Widget build(BuildContext context) {
    final dark = GHelperFunctions.isDarkMode(context);
    return AppBar(
      centerTitle: centerTitle,
      automaticallyImplyLeading: false,
      leading: showBackArrow
          ? IconButton(
              onPressed: () => Get.back(),
              icon: Icon(
                Iconsax.arrow_left,
                color: dark ? GColors.white : GColors.dark,
              ))
          : leadingIcon != null
              ? IconButton(onPressed: leadingOnPressed, icon: Icon(leadingIcon))
              : null,
      title: title,
      backgroundColor: backgroundColor,
      actions: actions,
      bottom: bottom,
    );
  }

  @override
  // implement preferredSize
  Size get preferredSize => Size.fromHeight(GDeviceUtils.getAppBarHeight() * 2);
}
