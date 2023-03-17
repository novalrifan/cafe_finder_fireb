import 'package:flutter/material.dart';

import '../../../../../../constants/images_source.dart';
import '../../widgets/header_image_widget.dart';

class ImageHorizon extends StatelessWidget {
  const ImageHorizon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const DashboardImageHeaderWidget(
          imgPt: tCatImage1,
          colorImg: Colors.teal,
        ),
        DashboardImageHeaderWidget(
          imgPt: tCatImage2,
          colorImg: Colors.pink.shade400,
        ),
        DashboardImageHeaderWidget(
          imgPt: tCatImage3,
          colorImg: Colors.amber.shade600,
        ),
        const DashboardImageHeaderWidget(
          imgPt: tCatImage4,
          colorImg: Colors.blueGrey,
        ),
      ],
    );
  }
}
