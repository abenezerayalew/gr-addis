// import 'package:flutter/material.dart';
// import 'package:iconsax/iconsax.dart';

// import '../../../../utils/constants/sizes.dart';
// import '../../layout/grid_layout.dart';
// import '../product_cards/product_card_vertical.dart';

// class GSortableProducts extends StatelessWidget {
//   const GSortableProducts({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         /// Dropdown
//         DropdownButtonFormField(
//           decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
//           onChanged: (value) {},
//           items: [
//             'Name',
//             'Higher Price',
//             'Lower Price',
//             'Sale',
//             'Newest',
//             'Popularity'
//           ]
//               .map((option) =>
//                   DropdownMenuItem(value: option, child: Text(option)))
//               .toList(),
//         ),
//         const SizedBox(height: GSizes.spaceBtwSections),

//         /// Products
//         GGridLayout(
//             itemCount: 4, itemBuilder: (_, index) => const GProductCardVertical())
//       ],
//     );
//   }
// }
