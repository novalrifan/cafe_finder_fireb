import 'package:flutter/material.dart';

class DashboardImageHeaderWidget extends StatelessWidget {
  final String imgPt;
  final Color? colorImg;
  const DashboardImageHeaderWidget(
      {Key? key, required this.imgPt, this.colorImg})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.only(
        left: 8,
        right: 10,
      ),
      child: SizedBox(
        width: 70,
        height: 100,
        child: Row(
          children: [
            Container(
              width: 70,
              height: 120,
              decoration: BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: isDarkMode
                          ? Colors.black87
                          : Colors.blueGrey.withOpacity(0.4),
                      offset: const Offset(4, 4),
                      blurRadius: 16)
                ],
                // gradient: LinearGradient(
                //     begin: Alignment.topCenter,
                //     end: Alignment.bottomCenter,
                //     colors: [
                //       greyShade,
                //       black,
                //       Colors.blueGrey,
                //     ]),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                      color: colorImg, borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Image.asset(
                      imgPt,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
