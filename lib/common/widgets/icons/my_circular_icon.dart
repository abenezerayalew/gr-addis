import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_functions.dart';
import '/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class GCircularIcon extends StatelessWidget {
  /// A custom Circular Icon Widget with a background color.
  ///
  /// Proerties are:
  /// Container [width], [height], & [backgroundColor]
  ///
  /// Icon's [size], [color] & [onPressed]
  const GCircularIcon(
      {super.key,
      this.width,
      this.height,
      this.size = GSizes.lg,
      required this.icon,
      this.color,
      this.backgroundColor,
      this.onPressed});

  final double? width, height, size;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final dark = GHelperFunctions.isDarkMode(context);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor != null
            ? backgroundColor!
            : dark
                ? GColors.black.withOpacity(0.9)
                : GColors.grey.withOpacity(0.8),
        borderRadius: BorderRadius.circular(100),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: color,
          size: size,
        ),
      ),
    );
  }
}
