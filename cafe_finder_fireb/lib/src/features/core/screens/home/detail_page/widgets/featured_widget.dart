import 'package:flutter/material.dart';

class FeaturedWidg extends StatelessWidget {
  const FeaturedWidg({
    Key? key,
    required this.title,
    required this.press,
    required this.tText,
  }) : super(key: key);
  final String title;
  final VoidCallback press;
  final TextTheme tText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: tText.headline4!.copyWith(fontWeight: FontWeight.bold),
        ),
        TextButton(onPressed: press, child: Text(''))
      ],
    );
  }
}
