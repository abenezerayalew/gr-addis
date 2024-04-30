import 'package:flutter/material.dart';
import 'package:green_addis_v1/utils/constants/image_string.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class WeatherContainer extends StatelessWidget {
  const WeatherContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = GHelperFunctions.isDarkMode(context);
    return Container(
      width: double.infinity,
      height: GHelperFunctions.screenHeight() * 0.27,
      decoration: BoxDecoration(
        color: GColors.white.withOpacity(0.6),
        borderRadius: BorderRadius.circular(GSizes.cardRadiusLg),
        boxShadow: [
          BoxShadow(
            color: GColors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        children: [
          const SizedBox(height: GSizes.sm),
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Column(
                  children: [
                    SizedBox(height: GSizes.sm),
                    Text('29°', style: TextStyle(fontSize: 34)),
                    Text('Sunny', style: TextStyle(fontSize: 12)),
                  ],
                ),
                Image.asset(GImages.weatherIcon, width: 40, height: 40),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(width: GSizes.sm),
              Flexible(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: dark
                        ? GColors.linerGradientForWeatherContainerDark
                        : GColors.linerGradientBgLightForHome,
                    borderRadius: BorderRadius.circular(GSizes.cardRadiusSm),
                  ),
                  child: const ListTile(
                    leading: Icon(Iconsax.location, color: GColors.white),
                    title: Text('Pressure',
                        style: TextStyle(
                            fontSize: 12, overflow: TextOverflow.ellipsis)),
                    subtitle: Text('29.92'),
                  ),
                ),
              ),
              const SizedBox(width: GSizes.sm),
              Flexible(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: dark
                        ? GColors.linerGradientForWeatherContainerDark
                        : GColors.linerGradientBgLightForHome,
                    borderRadius: BorderRadius.circular(GSizes.cardRadiusSm),
                  ),
                  child: const ListTile(
                    leading: Icon(Iconsax.location, color: GColors.white),
                    title: Text('Pressure',
                        style: TextStyle(
                            fontSize: 12, overflow: TextOverflow.ellipsis)),
                    subtitle: Text('29.92'),
                  ),
                ),
              ),
              const SizedBox(width: GSizes.sm),
              Flexible(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: dark
                        ? GColors.linerGradientForWeatherContainerDark
                        : GColors.linerGradientBgLightForHome,
                    borderRadius: BorderRadius.circular(GSizes.cardRadiusSm),
                  ),
                  child: const ListTile(
                      leading:
                          Icon(Iconsax.location, color: GColors.white),
                      title: Text('Pressure',
                          style: TextStyle(
                              fontSize: 12, overflow: TextOverflow.ellipsis)),
                      subtitle: Text('29.92')),
                ),
              ),
              const SizedBox(width: GSizes.sm),
            ],
          ),
          const SizedBox(height: GSizes.md),
        ],
      ),
    );
  }
}
