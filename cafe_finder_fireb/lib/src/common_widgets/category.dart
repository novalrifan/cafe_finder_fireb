import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  final String imagePath;
  final String title;
  const Category({Key? key, required this.imagePath, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        // ignore: sized_box_for_whitespace
        child: Container(
          width: 50,
          height: 60,
          child: Expanded(
            child: Column(
              children: [
                Image.asset(
                  imagePath,
                  width: 30,
                  color: Theme.of(context).primaryColor,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyText2,
                  selectionColor: Theme.of(context).primaryColorDark,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
