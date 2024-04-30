import '/common/widgets/custom_shapes/containers/rounded_container.dart';
import '/utils/constants/colors.dart';
import '/utils/constants/sizes.dart';
import '/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class GSingleAddress extends StatelessWidget {
  const GSingleAddress({super.key, required this.selectedAddress});
  final bool selectedAddress;
  @override
  Widget build(BuildContext context) {
    final dark = GHelperFunctions.isDarkMode(context);

    return GRoundedContainer(
      padding: const EdgeInsets.all(GSizes.md),
      width: double.infinity,
      shadowBorder: true,
      backgroundColor: selectedAddress
          ? GColors.primary.withOpacity(0.5)
          : Colors.transparent,
      borderColor: selectedAddress
          ? Colors.transparent
          : dark
              ? GColors.darkerGrey
              : GColors.grey,
      margin: const EdgeInsets.only(bottom: GSizes.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 0,
            child: Icon(selectedAddress ? Iconsax.tick_circle5 : null,
                color: selectedAddress
                    ? dark
                        ? GColors.light
                        : GColors.dark
                    : null),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('john Doe',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: GSizes.sm / 2),
              const Text('+1 234 567 8900',
                  maxLines: 1, overflow: TextOverflow.ellipsis),
              const SizedBox(height: GSizes.sm / 2),
              const Text('82334 Timmy coves South Liana, Maine, 87663, USA',
                  softWrap: true),
            ],
          )
        ],
      ),
    );
  }
}
