import 'package:flutter/material.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/sizes.dart';

import 'widgets/product_form.dart';

class UploadProducts extends StatelessWidget {
  const UploadProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GAppBar(
        title: Text('Upload Products Data'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              left: GSizes.defaultSpace, right: GSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// Headings and Texts
              Text(
                  'Upload your product data here. This data will be used to display products on the app.',
                  style: Theme.of(context).textTheme.labelMedium),
              const SizedBox(height: GSizes.spaceBtwItems),

              /// Text field and Button
              const ProductForm(),

              const SizedBox(height: GSizes.spaceBtwSections),
            ],
          ),
        ),
      ),
    );
  }
}
