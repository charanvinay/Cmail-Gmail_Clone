import 'package:flutter/material.dart';

class HeadingText extends StatelessWidget {
  const HeadingText({
    Key? key,
    required this.text,
    this.fontSize = 13,
  }) : super(key: key);

  final String text;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Text(text.toUpperCase(),
          style: Theme.of(context).textTheme.subtitle2!.copyWith(
                fontWeight: FontWeight.w500,
                letterSpacing: 1.5,
                fontSize: fontSize,
              )
          // TextStyle(
          //   fontSize: fontSize,
          //   letterSpacing: 1.5,
          //   fontWeight: FontWeight.w500,
          //   color: textColorLight,
          // ),
          ),
    );
  }
}
