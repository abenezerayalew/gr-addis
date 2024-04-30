import 'package:flutter/material.dart';

class GBlogDateText extends StatelessWidget {
  const GBlogDateText(
      {super.key,
      required this.date,
      this.smallSize = false,
      this.maxLines = 1,
      this.textAlign = TextAlign.left});
  final String date;
  final bool? smallSize;
  final int? maxLines;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      date,
      style: smallSize!
          ? Theme.of(context).textTheme.labelLarge
          : Theme.of(context).textTheme.labelSmall,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}
