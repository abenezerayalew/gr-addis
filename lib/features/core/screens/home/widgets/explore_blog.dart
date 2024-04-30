import 'package:flutter/material.dart';
import '/utils/constants/sizes.dart';
import '../../../../../common/widgets/blog/blog_card/blog_card.dart';

class ExploreBlog extends StatelessWidget {
  const ExploreBlog({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (_, int index) => const SizedBox(
                width: GSizes.spaceBtwItems,
              ),
          itemBuilder: (_, int index) => const GBlogCardHorizontal(),
          itemCount: 8),
    );
  }
}
