// ignore_for_file: public_member_api_docs, sort_constructors_first, file_names, unused_local_variable
// ignore_for_file: unnecessary_new

import 'package:cafe_finder_fireb/src/common_widgets/animation/loading_widget.dart';
import 'package:cafe_finder_fireb/src/constants/color.dart';
import 'package:cafe_finder_fireb/src/constants/images_source.dart';
import 'package:cafe_finder_fireb/src/constants/shared/shared_pref.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:haversine_distance/haversine_distance.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

import '../../../../models/coffeestore_model.dart';

// ignore: must_be_immutable
class Dummy extends StatefulWidget {
  final Coffeeshops coffeeshops;

  const Dummy({
    Key? key,
    required this.coffeeshops,
  }) : super(key: key);

  @override
  State<Dummy> createState() => _DummyState();
}

class _DummyState extends State<Dummy> with SingleTickerProviderStateMixin {
  LatLng latLng = getLatLngFromSharedPrefs();

  final haversineDistance = HaversineDistance();

  late AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 3),
        lowerBound: 0.0,
        upperBound: 1.0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //-- Theme Data
    var mediaQuery = MediaQuery.of(context);
    var brightness = mediaQuery.platformBrightness;
    final tText = Theme.of(context).textTheme;
    final isDarkMode = brightness == Brightness.dark;

    //-- Image Data
    // final imgMenu = coffeeshops.imgMenu!.isEmpty
    //     ? 'https://firebasestorage.googleapis.com/v0/b/coffee-fire.appspot.com/o/no-image-icon-23494.png?alt=media&token=b86d3345-ec80-465a-95fd-98fdf644c947'
    //     : coffeeshops.imgMenu!.startsWith(
    //             'https://b.zmtcdn.com/images/res_avatar_476_320_1x_new.png')
    //         ? 'https://firebasestorage.googleapis.com/v0/b/coffee-fire.appspot.com/o/no-image-icon-23494.png?alt=media&token=b86d3345-ec80-465a-95fd-98fdf644c947'
    //         : coffeeshops.imgMenu!.toString();
    // final imgOne = coffeeshops.imgPrimUrl!.isEmpty
    //     ? 'https://firebasestorage.googleapis.com/v0/b/coffee-fire.appspot.com/o/no-image-icon-23494.png?alt=media&token=b86d3345-ec80-465a-95fd-98fdf644c947'
    //     : coffeeshops.imgPrimUrl!.startsWith(
    //             'https://b.zmtcdn.com/images/res_avatar_476_320_1x_new.png')
    //         ? 'https://firebasestorage.googleapis.com/v0/b/coffee-fire.appspot.com/o/no-image-icon-23494.png?alt=media&token=b86d3345-ec80-465a-95fd-98fdf644c947'
    //         : coffeeshops.imgPrimUrl!.toString();
    // final imgTwo = coffeeshops.imgSecUrl!.isEmpty
    //     ? 'https://firebasestorage.googleapis.com/v0/b/coffee-fire.appspot.com/o/no-image-icon-23494.png?alt=media&token=b86d3345-ec80-465a-95fd-98fdf644c947'
    //     : coffeeshops.imgSecUrl!.startsWith(
    //             'https://b.zmtcdn.com/images/res_avatar_476_320_1x_new.png')
    //         ? 'https://firebasestorage.googleapis.com/v0/b/coffee-fire.appspot.com/o/no-image-icon-23494.png?alt=media&token=b86d3345-ec80-465a-95fd-98fdf644c947'
    //         : coffeeshops.imgSecUrl!.toString();
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/coffeeshop-detailsnew',
          arguments: widget.coffeeshops,
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 16),
        child: Container(
          width: MediaQuery.of(context).size.width - 70,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(16.0)),

              // border: Border(top: BorderSide(width: 2, color: white)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: isDarkMode ? Colors.black87 : white,
                    offset: const Offset(4, 4),
                    blurRadius: 16)
              ]),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(16.0)),
            child: Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 2,

                      child: ExtendedImage.network(
                        // widget.coffeeshops.imgPrimUrl.toString().isEmpty
                        //     ? defaultImage
                        widget.coffeeshops.imgPrimUrl
                                .toString()
                                .contains(defaultImage)
                            ? widget.coffeeshops.imgSecUrl!
                            : widget.coffeeshops.imgSecUrl
                                    .toString()
                                    .contains(defaultImage)
                                ? brokenImage
                                : widget.coffeeshops.chainName!
                                        .toString()
                                        .contains('Fore Coffee')
                                    ? widget.coffeeshops.imgSecUrl!
                                    : widget.coffeeshops.imgPrimUrl!,
                        fit: BoxFit.fill,

                        // widget.coffeeshops.isChain == true
                        //     ? BoxFit.contain
                        //     : widget.coffeeshops.imgPrimUrl!.isEmpty
                        //         ? BoxFit.contain
                        //         : widget.coffeeshops.imgPrimUrl!.contains(
                        //                 'https://b.zmtcdn.com/data/pictures/chains/9/18516659/8b48dd1eacaf61fc6a15730f1402a907_featured_v2.jpg')
                        //             ? BoxFit.contain
                        //             : widget.coffeeshops.imgPrimUrl!.contains(
                        //                     'https://b.zmtcdn.com/images/res_avatar_476_320_1x_new.png')
                        //                 ? BoxFit.contain
                        //                 : BoxFit.cover,
                        cache: true,
                        loadStateChanged: (ExtendedImageState state) {
                          switch (state.extendedImageLoadState) {
                            case LoadState.loading:
                              _controller.reset();
                              return const Center(
                                child: LoadingWidget(),
                              );
                            case LoadState.completed:
                              _controller.forward();
                              return FadeTransition(
                                  opacity: _controller,
                                  child: ExtendedRawImage(
                                    image: state.extendedImageInfo?.image,
                                    fit: widget.coffeeshops.chainName!
                                            .toString()
                                            .startsWith(RegExp(
                                                'Starbucks Coffee Company'))
                                        ? BoxFit.cover
                                        : widget.coffeeshops.chainName!
                                                .toString()
                                                .startsWith(
                                                    RegExp('Maxx Coffee'))
                                            ? BoxFit.contain
                                            : widget.coffeeshops.chainName!
                                                    .toString()
                                                    .startsWith(
                                                        RegExp('Fore Coffee'))
                                                ? BoxFit.contain
                                                : BoxFit.cover,
                                  ));

                            case LoadState.failed:
                              _controller.reset();
                              state.imageProvider.evict();
                              return Image.network(noImage);
                          }
                        },
                      ),
                      // CachedNetworkImage(
                      //   placeholder: (context, url) => new Center(
                      //     child: loadingwidget(),
                      //   ),
                      //   errorWidget: (context, url, error) => new Container(
                      //     color: Colors.amber,
                      //     alignment: Alignment.center,
                      //     child: const Text(
                      //       'Whoops!',
                      //       style: TextStyle(fontSize: 30),
                      //     ),
                      //   ),
                      //   imageUrl: widget.coffeeshops.imgPrimUrl!.isEmpty
                      //       ? noImage
                      //       : widget.coffeeshops.imgPrimUrl!.contains(
                      //               'https://b.zmtcdn.com/images/res_avatar_476_320_1x_new.png')
                      //           ? noImage
                      //           : widget.coffeeshops.imgPrimUrl!.contains(
                      //                   'https://b.zmtcdn.com/data/pictures/chains/9/18516659/8b48dd1eacaf61fc6a15730f1402a907_featured_v2.jpg')
                      //               ? noImage
                      //               : widget.coffeeshops.imgSecUrl!.isEmpty
                      //                   ? noImage
                      //                   : widget.coffeeshops.imgSecUrl!.contains(
                      //                           'https://b.zmtcdn.com/images/res_avatar_476_320_1x_new.png')
                      //                       ? noImage
                      //                       : widget.coffeeshops.imgSecUrl!
                      //                               .contains(
                      //                                   'https://b.zmtcdn.com/data/pictures/chains/9/18516659/8b48dd1eacaf61fc6a15730f1402a907_featured_v2.jpg')
                      //                           ? noImage
                      //                           : widget.coffeeshops.chainName!
                      //                                   .contains('Fore Coffee')
                      //                               ? widget
                      //                                   .coffeeshops.imgSecUrl!
                      //                               : widget.coffeeshops
                      //                                   .imgPrimUrl!,
                      //   fit: widget.coffeeshops.isChain == true
                      //       ? BoxFit.contain
                      //       : widget.coffeeshops.imgPrimUrl!.isEmpty
                      //           ? BoxFit.contain
                      //           : widget.coffeeshops.imgPrimUrl!.contains(
                      //                   'https://b.zmtcdn.com/data/pictures/chains/9/18516659/8b48dd1eacaf61fc6a15730f1402a907_featured_v2.jpg')
                      //               ? BoxFit.contain
                      //               : widget.coffeeshops.imgPrimUrl!
                      //                       .toString()
                      //                       .contains(
                      //                           'https://b.zmtcdn.com/images/res_avatar_476_320_1x_new.png')
                      //                   ? BoxFit.contain
                      //                   : BoxFit.cover,
                      // ),
                      // Image.network(
                      //   coffeeshops.imgPrimUrl!.isEmpty
                      //       ? noImage
                      //       : coffeeshops.imgPrimUrl!.contains(
                      //               'https://b.zmtcdn.com/images/res_avatar_476_320_1x_new.png')
                      //           ? noImage
                      //           : coffeeshops.imgPrimUrl!.contains(
                      //                   'https://b.zmtcdn.com/data/pictures/chains/9/18516659/8b48dd1eacaf61fc6a15730f1402a907_featured_v2.jpg')
                      //               ? noImage
                      //               : coffeeshops.imgSecUrl!.isEmpty
                      //                   ? noImage
                      //                   : coffeeshops.imgSecUrl!.contains(
                      //                           'https://b.zmtcdn.com/images/res_avatar_476_320_1x_new.png')
                      //                       ? noImage
                      //                       : coffeeshops.imgSecUrl!.contains(
                      //                               'https://b.zmtcdn.com/data/pictures/chains/9/18516659/8b48dd1eacaf61fc6a15730f1402a907_featured_v2.jpg')
                      //                           ? noImage
                      //                           : coffeeshops.name!
                      //                                   .contains('Fore Coffee')
                      //                               ? coffeeshops.imgSecUrl!
                      //                               : coffeeshops.imgPrimUrl!,
                      //   fit: coffeeshops.isChain == true
                      //       ? BoxFit.contain
                      //       : coffeeshops.imgPrimUrl!.isEmpty
                      //           ? BoxFit.contain
                      //           : coffeeshops.imgPrimUrl!.contains(
                      //                   'https://b.zmtcdn.com/data/pictures/chains/9/18516659/8b48dd1eacaf61fc6a15730f1402a907_featured_v2.jpg')
                      //               ? BoxFit.contain
                      //               : coffeeshops.imgPrimUrl!.toString().contains(
                      //                       'https://b.zmtcdn.com/images/res_avatar_476_320_1x_new.png')
                      //                   ? BoxFit.contain
                      //                   : BoxFit.cover,
                      //   errorBuilder: ((context, error, stackTrace) {
                      //     return Container(
                      //       color: Colors.amber,
                      //       alignment: Alignment.center,
                      //       child: const Text(
                      //         'Whoops!',
                      //         style: TextStyle(fontSize: 30),
                      //       ),
                      //     );
                      //   }),
                      //   filterQuality: FilterQuality.high,
                      // ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            // decoration: BoxDecoration(
                            //     border: Border(
                            //   bottom: BorderSide(
                            //       width: 0.18,
                            //       color: coffeeshops.imgPrimUrl!.contains(
                            //               'https://b.zmtcdn.com/images/res_avatar_476_320_1x_new.png')
                            //           ? isDarkMode
                            //               ? white
                            //               : Colors.black54
                            //           : Colors.transparent),
                            //   left: BorderSide(
                            //       width: 0.15,
                            //       color: coffeeshops.imgPrimUrl!.contains(
                            //               'https://b.zmtcdn.com/images/res_avatar_476_320_1x_new.png')
                            //           ? isDarkMode
                            //               ? white
                            //               : Colors.black54
                            //           : Colors.transparent),
                            // )),
                            padding: const EdgeInsets.only(
                                left: 16, top: 8, bottom: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  widget.coffeeshops.name.toString(),
                                  textAlign: TextAlign.left,
                                  style: tText.bodyText2!.copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Expanded(
                                      child: Text(
                                        'C1: ${widget.coffeeshops.cFaciility}',
                                        style: tText.bodyText2!.copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10,
                                          color:
                                              isDarkMode ? white : tSecondary,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                  ],
                                ),
                                Text(
                                  'C2: ${widget.coffeeshops.cRate}',
                                  // widget.coffeeshops.tags.toString(),
                                  style: tText.bodyText2!.copyWith(
                                    fontSize: 11,
                                    fontStyle: FontStyle.italic,
                                    color: isDarkMode
                                        ? white.withOpacity(0.7)
                                        : tSecondary.withOpacity(0.7),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 4),
                                  child: Row(
                                    children: <Widget>[
                                      RatingBar(
                                        ratingWidget: RatingWidget(
                                          full: const Icon(
                                            Icons.star_rate_rounded,
                                            color: Colors.yellow,
                                          ),
                                          half: const Icon(
                                            Icons.star_half_rounded,
                                            color: Colors.yellow,
                                          ),
                                          empty: const Icon(
                                            Icons.star_border_rounded,
                                            color: Colors.yellow,
                                          ),
                                        ),
                                        onRatingUpdate: (value) {},
                                        itemPadding: EdgeInsets.zero,
                                        initialRating: widget
                                            .coffeeshops.average!
                                            .toDouble(),
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemSize: 20,
                                      ),
                                      Text(
                                          '${widget.coffeeshops.count ?? 0.toInt()} Reviews',
                                          style: tText.bodyText2!.copyWith(
                                              fontSize: 11,
                                              fontStyle: FontStyle.italic,
                                              color: isDarkMode
                                                  ? white.withOpacity(0.7)
                                                  : tSecondary
                                                      .withOpacity(0.7))),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        // ignore: avoid_unnecessary_containers
                        Container(
                          // decoration: BoxDecoration(
                          //     border: Border(
                          //   top: BorderSide(
                          //       width: 0.1,
                          //       color: coffeeshops.imgPrimUrl!.toString().contains(
                          //               'https://b.zmtcdn.com/images/res_avatar_476_320_1x_new.png')
                          //           ? isDarkMode
                          //               ? white
                          //               : Colors.black54
                          //           : Colors.transparent),
                          //   right: BorderSide(
                          //       width: 0.15,
                          //       color: coffeeshops.imgPrimUrl!.toString().contains(
                          //               'https://b.zmtcdn.com/images/res_avatar_476_320_1x_new.png')
                          //           ? isDarkMode
                          //               ? white
                          //               : Colors.black54
                          //           : Colors.transparent),
                          // )),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 16, top: 11),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'C3: ${widget.coffeeshops.cPrice}',
                                  // widget.coffeeshops.forTwo! >= 200000
                                  //     ? '${(widget.coffeeshops.forTwo!) ~/ 5 ~/ 1000}K ~${(widget.coffeeshops.forTwo!) ~/ 1000}K'
                                  //     : widget.coffeeshops.forTwo! >= 100000
                                  //         ? '${(widget.coffeeshops.forTwo!) ~/ 4 ~/ 1000}K ~${(widget.coffeeshops.forTwo!) ~/ 1000}K'
                                  //         : '~ ${(widget.coffeeshops.forTwo!) ~/ 1000} K',
                                  textAlign: TextAlign.right,
                                  style: tText.bodyText2!.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  'C4${widget.coffeeshops.cDistance}',
                                  // widget.coffeeshops.forTwo!.toInt() < 45000
                                  //     ? ''
                                  //     : '/for two',
                                  style: tText.bodyText2!.copyWith(
                                      fontWeight: FontWeight.w100,
                                      fontSize: 10,
                                      fontStyle: FontStyle.italic,
                                      color: isDarkMode
                                          ? white.withOpacity(0.7)
                                          : tSecondary.withOpacity(0.7)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 4, top: 4, bottom: 4),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.location_on,
                                          size: 20, color: Colors.blue),
                                      Text(
                                          '${widget.coffeeshops.distance!.toStringAsFixed(1)} km',
                                          overflow: TextOverflow.ellipsis,
                                          style: tText.bodyText2!.copyWith(
                                              fontSize: 11,
                                              color: isDarkMode
                                                  ? Colors.white54
                                                  : Colors.black54,
                                              fontStyle: FontStyle.italic,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                const Positioned(
                    top: 8,
                    right: 8,
                    child: Material(
                      color: Colors.transparent,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.favorite_border,
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: double.infinity,
//       height: 260,
//       child: Stack(
//         children: [
//           Card(
//             clipBehavior: Clip.antiAliasWithSaveLayer,
//             shape:
//                 RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//             elevation: 10,
//             child: Column(
//               children: [
//                 SizedBox(
//                     width: double.infinity,
//                     height: 140,
//                     child: Image.asset(coffeeshops.photo.toString(),
//                         fit: BoxFit.cover))
//               ],
//             ),
//           ),
//           Positioned(
//             bottom: 0,
//             left: 10,
//             child: SizedBox(
//               height: 100,
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 10, right: 10),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(
//                       height: 35,
//                       child: Text(coffeeshops.name.toString(),
//                           style: Theme.of(context).textTheme.headline5),
//                     ),
//                     SizedBox(
//                       height: 20,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Column(
//                             children: [
//                               Text(
//                                 coffeeshops.cuisines.toString(),
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .bodyText2
//                                     ?.apply(color: tSecondary),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 7,
//                     ),
//                     Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         const Icon(Icons.star, color: Colors.amber),
//                         const SizedBox(
//                           width: 5,
//                         ),
//                         Text("This Rating",
//                             style: Theme.of(context).textTheme.bodyText2),
//                         const SizedBox(
//                           width: 10,
//                         ),
//                         const Icon(Icons.access_time, color: Colors.grey),
//                         const SizedBox(
//                           width: 5,
//                         ),
//                         Text(coffeeshops.timing.toString(),
//                             style: Theme.of(context).textTheme.bodyText2),
//                         const SizedBox(
//                           width: 10,
//                         ),
//                         Text("This Price",
//                             style: Theme.of(context).textTheme.bodyText2),
//                         const SizedBox(
//                           width: 15,
//                         ),
//                         Text("this Distance",
//                             style: Theme.of(context).textTheme.bodyText2),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
