import 'package:flutter/material.dart';

class GSectionHeading extends StatelessWidget {
  const GSectionHeading({
    super.key,
    required this.title,
    this.buttonTitle = 'View All',
    this.onPressed,
    this.showActionButton = true,
    this.smallSize = true,
    this.textColor,
  });
  final String title, buttonTitle;
  final VoidCallback? onPressed;
  final bool? showActionButton, smallSize;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: smallSize!
                ? Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .apply(color: textColor)
                : Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .apply(color: textColor),
            maxLines: 1,
            overflow: TextOverflow.ellipsis),
        if (showActionButton!)
          TextButton(onPressed: onPressed, child: Text(buttonTitle)),
      ],
    );
  }
}
