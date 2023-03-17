import 'package:cafe_finder_fireb/src/constants/color.dart';
import 'package:cafe_finder_fireb/src/constants/text_string.dart';
import 'package:flutter/material.dart';

class DashboardSearchBox extends StatelessWidget {
  const DashboardSearchBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;
    return Card(
      child: Container(
        height: 40,
        width: 330,
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(width: 4, color: isDarkMode ? white : black),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              tDashboardSearch,
              style: Theme.of(context)
                  .textTheme
                  .headline2
                  ?.apply(color: Colors.grey.withOpacity(0.5)),
            ),
            const Icon(
              Icons.search,
              size: 25,
            ),
          ],
        ),
      ),
    );
  }
}
