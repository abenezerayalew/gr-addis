import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';

class GCircularContainer extends StatelessWidget {
  const GCircularContainer({
    super.key,
    this.width = 400,
    this.height = 400,
    this.radius = 400,
    this.margin,
    this.padding = 0,
    this.child,
    this.backgroundColor = GColors.white,
  });
  final double? width;
  final double? height;
  final double? radius;
  final double? padding;
  final EdgeInsets? margin;
  final Widget? child;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: EdgeInsets.all(padding ?? 0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 0),
          color: backgroundColor),
      child: child,
    );
  }
}
