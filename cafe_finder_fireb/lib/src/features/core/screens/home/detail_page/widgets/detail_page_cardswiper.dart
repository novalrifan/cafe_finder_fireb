import 'package:cafe_finder_fireb/src/constants/color.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class CardSwipe extends StatelessWidget {
  const CardSwipe({
    Key? key,
    required this.height,
    required this.images,
  }) : super(key: key);

  final double height;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.37,
      width: double.infinity,
      child: Swiper(
        itemBuilder: (context, index) => Image.network(
          images.elementAt(index),
          fit: BoxFit.fitHeight,
          filterQuality: FilterQuality.high,
        ),
        autoplay: true,
        itemCount: images.length,
        pagination: const SwiperPagination(
            builder: DotSwiperPaginationBuilder(
          color: black,
          activeColor: Colors.red,
        )),
      ),
    );
  }
}
