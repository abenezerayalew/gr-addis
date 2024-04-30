import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../controllers/signup/signup_controller.dart';

class TermAndConditions extends StatelessWidget {
  const TermAndConditions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = SignUpControlller.instance;
    final dark = GHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Obx(() => Checkbox(
              value: controller.privacyPolicy.value,
              onChanged: (value) => controller.privacyPolicy.value =
                  !controller.privacyPolicy.value)),
        ),
        const SizedBox(width: GSizes.spaceBtwItems / 2),
        Flexible(
          child: Text.rich(
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              TextSpan(children: [
                TextSpan(
                    text: '${GTexts.iAgreeTo} ',
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                    text: '${GTexts.privacyPolicy} ',
                    style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: dark ? GColors.white : GColors.primary,
                        decoration: TextDecoration.underline,
                        decorationColor:
                            dark ? GColors.white : GColors.primary)),
                TextSpan(
                    text: '${GTexts.and} ',
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                    text: '${GTexts.termsofUse} ',
                    style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: dark ? GColors.white : GColors.primary,
                        decoration: TextDecoration.underline,
                        decorationColor:
                            dark ? GColors.white : GColors.primary)),
              ])),
        )
      ],
    );
  }
}
