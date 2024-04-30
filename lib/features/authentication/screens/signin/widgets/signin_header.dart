import 'package:flutter/material.dart';
import '../../../../../utils/constants/image_string.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class SigninHeader extends StatelessWidget {
  const SigninHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = GHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: GDeviceUtils.getAppBarHeight(),
        ),
        Align(
          alignment: Alignment.center,
          child: Image(
              height: 80,
              image: AssetImage(
                  dark ? GImages.darkAppLogo : GImages.lightAppLogo)),
        ),
        const SizedBox(height: GSizes.spaceBtwItems),
        Text(GTexts.signinTitle,
            style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: GSizes.sm),
        Text(GTexts.signinSubTitle,
            style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
