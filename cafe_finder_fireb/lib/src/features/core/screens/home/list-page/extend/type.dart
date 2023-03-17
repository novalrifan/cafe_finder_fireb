// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'package:cafe_finder_fireb/src/constants/color.dart';

class TypeList extends StatelessWidget {
  final bool isSelected;
  final String thisType;
  final VoidCallback onTap;
  const TypeList({
    Key? key,
    required this.isSelected,
    required this.thisType,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.circle,
                size: 12, color: isSelected ? Colors.blueGrey : white),
            const SizedBox(
              width: 5,
            ),
            Text(
              thisType,
              style: Theme.of(context).textTheme.headline4?.apply(
                  fontSizeFactor: 1.0,
                  color: isSelected ? Colors.blueGrey : white),
            ),
          ],
        ),
      ),
    );
  }
}
