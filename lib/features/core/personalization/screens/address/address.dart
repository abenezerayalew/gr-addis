import '../../../../../utils/constants/colors.dart';
import '/common/widgets/appbar/appbar.dart';
import '/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'add_new_address.dart';
import 'widgets/single_address.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: GColors.primary,
        onPressed: () => Get.to(() => const AddNewAddressScreen()),
        child: const Icon(Iconsax.add, color: GColors.white),
      ),
      appBar: GAppBar(
          title: Text(
            'Addresses',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          showBackArrow: true),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(GSizes.defaultSpace),
          child: Column(
            children: [
              GSingleAddress(selectedAddress: false),
              GSingleAddress(selectedAddress: true),
            ],
          ),
        ),
      ),
    );
  }
}
