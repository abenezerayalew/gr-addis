import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../shimmers/shimmer_loader.dart';

class GCircularImage extends StatelessWidget {
  const GCircularImage({
    super.key,
    required this.image,
    this.isNetworkImage = false,
    this.overlayColor,
    this.backgroundColor,
    this.width = 56,
    this.height = 56,
    this.padding = GSizes.sm,
    this.fit = BoxFit.cover,
    this.onTap,
    this.border = false,
    this.enableCachNetworkImage = true,
  });
  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final bool enableCachNetworkImage;
  final bool border;
  final Color? overlayColor;
  final bool? backgroundColor;
  final double width, height, padding;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    final dark = GHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
            border: border ? Border.all(color: GColors.primary) : null,
            color: backgroundColor == true
                ? (dark ? GColors.black : GColors.light)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(100)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Center(
            child: isNetworkImage
                ? enableCachNetworkImage
                    ? CachedNetworkImage(
                        fit: fit,
                        color: overlayColor,
                        imageUrl: image,
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) =>
                                const GShimmerEffect(width: 55, height: 55),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      )
                    : Image(
                        fit: fit,
                        image: NetworkImage(image),
                        color: overlayColor,
                      )
                : Image(
                    fit: fit,
                    image: AssetImage(image),
                    color: overlayColor,
                  ),
          ),
        ),
      ),
    );
  }
}
