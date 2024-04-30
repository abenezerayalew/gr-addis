import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/sizes.dart';

class PriceFilter extends StatefulWidget {
  const PriceFilter({super.key});

  @override
  State<PriceFilter> createState() => _PriceFilterState();
}

class _PriceFilterState extends State<PriceFilter> {
  double rate = 10;
  bool _isVisible = true;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Visibility(
          visible: _isVisible,
          child: Column(
            children: [
              const GSectionHeading(
                title: 'Set price range',
                showActionButton: false,
                smallSize: false,
              ),
              Slider(
                value: rate,
                onChanged: (newvalue) {
                  setState(() => rate = newvalue);
                },
                max: 100,
                min: 0,
                divisions: 100,
                label: '$rate',
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      // controller: controller.firstName,
                      expands: false,
                      decoration: const InputDecoration(
                          labelText: '0', prefixIcon: Icon(Iconsax.arrow_down)),
                    ),
                  ),
                  const SizedBox(width: GSizes.spaceBtwInputFields),
                  Expanded(
                    child: TextFormField(
                      // controller: controller.lastName,
                      expands: false,
                      decoration: InputDecoration(
                          labelText: '$rate',
                          prefixIcon: const Icon(Iconsax.arrow_up)),
                    ),
                  )
                ],
              ),
              const SizedBox(height: GSizes.spaceBtwItems),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {}, child: const Text('Apply')))
            ],
          )),
      IconButton(
        onPressed: () {
          setState(() {
            _isVisible = !_isVisible; // Toggle visibility
          });
        },
        icon: _isVisible
            ? const Icon(Iconsax.arrow_square_up, size: GSizes.iconLg)
            : const Icon(Iconsax.arrow_square_down, size: GSizes.iconLg),
      ),
      const SizedBox(height: GSizes.spaceBtwItems),
    ]);
  }
}
