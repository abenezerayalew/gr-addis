import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../../uploader/screens/upload products/uploader_products.dart';
import 'widgets/seed_tab.dart';
import 'widgets/tools_tab.dart';
import 'widgets/vegetable_tab.dart';
import 'widgets/wishlist.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = GHelperFunctions.isDarkMode(context);
    // final categories = CategoryController.instance.featuredCategories;
    return DefaultTabController(
      // length: categories.length,
      length: 5,
      child: Padding(
        padding: const EdgeInsets.only(top: GSizes.defaultSpace * 1.5),
        child: Scaffold(
            appBar: GAppBar(
                title: Row(
                  children: [
                    Text('Store',
                        style: Theme.of(context).textTheme.headlineMedium),
                    const Spacer(),
                    OutlinedButton(
                      onPressed: () => Get.to(() => const UploadProducts()),
                      child: const Text(
                        '+  Sell',
                      ),
                    ),
                    const SizedBox(width: GSizes.defaultSpace),
                    SizedBox(
                      width: 100,
                      child: ElevatedButton(
                          onPressed: () =>
                              Get.to(() => const FavouriteScreen()),
                          child: const Text('Wishlist')),
                    )
                  ],
                ),
                bottom: TabBar(
                  isScrollable: true,
                  indicatorColor: dark ? Colors.white : Colors.black,
                  tabs: const [
                    Tab(
                      text: 'Vegetables',
                    ),
                    Tab(
                      text: 'Seeds',
                    ),
                    Tab(
                      text: 'Tools & Equipments',
                    ),
                    Tab(
                      text: 'Fertilizers',
                    ),
                  ],
                ),
                actions: const []),

            /// --Tabs
            // bottom:
            // MyTabBar(
            //   tabs: categories
            //       .map((category) => Tab(child: Text(category.name)))
            //       .toList(),
            //   // [

            // ],
            // ),

            body: const TabBarView(
              children:
                  // categories
                  //     .map((category) => MyCategoryTab(category: category))
                  //     .toList()
                  [GVegetablesTab(), GSeedTab(), GToolTab(), GVegetablesTab()],
            )),
      ),
    );
  }
}
