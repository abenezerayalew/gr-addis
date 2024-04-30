import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class GNavigationStyle extends StatelessWidget {
  const GNavigationStyle(
      {super.key,
      required this.controller,
      required this.icon,
      required this.color,
      required this.label});
  final dynamic controller;
  final IconData icon;
  final Color color;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      if (controller)
        Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            height: 7.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: GSizes.md),
              child: Container(
                decoration: const BoxDecoration(
                    color: GColors.primary,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(7),
                        bottomRight: Radius.circular(7))),
              ),
            )),
      NavigationDestination(
          icon: Icon(
            icon,
            color: color,
          ),
          label: label),
    ]);
  }
}
