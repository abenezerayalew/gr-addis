import 'package:flutter/material.dart';
import 'package:green_addis_v1/utils/helpers/helper_functions.dart';

import '../../../../utils/constants/colors.dart';

class GCurvedEdgesWidget extends StatelessWidget {
  const GCurvedEdgesWidget({
    super.key,
    required this.child,
    this.backgroundColor = GColors.linerGradientForContainerDark,
  });

  final Widget child;
  final Gradient backgroundColor;

  @override
  Widget build(BuildContext context) {
    final dark = GHelperFunctions.isDarkMode(context);
    return Container(
      decoration: BoxDecoration(
        gradient: dark ? backgroundColor : GColors.linerGradientBgLightForHome,
        // borderRadius: const BorderRadius.only(
        //   bottomLeft: Radius.circular(50),
        //   bottomRight: Radius.circular(50),
        // ),
      ),
      padding: const EdgeInsets.all(0),
      child: child,
    );
  }
}
