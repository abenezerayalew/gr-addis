import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';
import '../../../../utils/helpers/helper_functions.dart';

class GSearchContainer extends StatelessWidget {
  const GSearchContainer({
    super.key,
    this.showBackground = true,
    this.showBorder = true,
    required this.hintText,
    this.icon = Iconsax.search_normal,
    this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: GSizes.defaultSpace),
  });
  final bool? showBackground, showBorder;
  final String hintText;
  final IconData? icon;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;
  @override
  Widget build(BuildContext context) {
    final dark = GHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Container(
          width: GDeviceUtils.getScreenWidth(context),
          padding: const EdgeInsets.all(GSizes.md),
          decoration: BoxDecoration(
              color: showBackground!
                  ? dark
                      ? GColors.dark
                      : GColors.light
                  : Colors.transparent,
              border: showBorder! ? Border.all(color: Colors.grey) : null,
              borderRadius: BorderRadius.circular(GSizes.cardRadiusLg)),
          child: Row(
            children: [
              Icon(icon, color: dark ? GColors.darkerGrey : GColors.grey),
              const SizedBox(width: GSizes.spaceBtwItems),
              Text(hintText, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
      ),
    );
  }
}
