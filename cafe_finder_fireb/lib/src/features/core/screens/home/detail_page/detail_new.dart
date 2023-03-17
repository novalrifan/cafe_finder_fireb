// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

import 'package:cafe_finder_fireb/src/constants/color.dart';
import 'package:cafe_finder_fireb/src/utils/theme/widgets_theme/map_box_theme.dart';

import '../../../../../common_widgets/animation/loading_widget.dart';
import '../../../../../constants/images_source.dart';
import '../../../bloc/blocs.dart';
import '../../../models/coffeestore_model.dart';
import 'widgets/featured_widget.dart';

class DetailP extends StatefulWidget {
  static const String routeName = '/coffeeshop-detailsnew';
  static Route route({required Coffeeshops coffeeshops}) {
    return MaterialPageRoute(builder: (_) => DetailP(coffeeshops: coffeeshops));
  }

  final Coffeeshops coffeeshops;

  const DetailP({Key? key, required this.coffeeshops}) : super(key: key);

  @override
  State<DetailP> createState() => _DetailPState();
}

class _DetailPState extends State<DetailP> with SingleTickerProviderStateMixin {
  int pageIndex = 0;
  late MapboxMapController controller;
  late CameraPosition _placeCamera;
  late AnimationController _controller;

  // final List<String> _offerImages = [tCatImage1, tCatImage2, tCatImage3];
  @override
  void initState() {
    _controller = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 3),
        lowerBound: 0.0,
        upperBound: 1.0);
    super.initState();

    _placeCamera = CameraPosition(
        target: LatLng(widget.coffeeshops.latitude!.toDouble(),
            widget.coffeeshops.longitude!.toDouble()),
        zoom: 13.5);
  }

  _onMapCreated(MapboxMapController controller) async {
    this.controller = controller;
  }

  _onStyleLoadedCallback() async {
    await controller.addSymbol(SymbolOptions(
      geometry: _placeCamera.target,
      iconSize: 0.23,
      iconImage: markIcon,
    ));
    controller.animateCamera(CameraUpdate.newCameraPosition(_placeCamera));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final imgMenu = widget.coffeeshops.imgMenu!.isEmpty
        ? 'https://firebasestorage.googleapis.com/v0/b/coffee-fire.appspot.com/o/no-image-icon-23494.png?alt=media&token=b86d3345-ec80-465a-95fd-98fdf644c947'
        : widget.coffeeshops.imgMenu!.contains(RegExp(
                'https://b.zmtcdn.com/images/res_avatar_476_320_1x_new.png'))
            ? 'https://firebasestorage.googleapis.com/v0/b/coffee-fire.appspot.com/o/no-image-icon-23494.png?alt=media&token=b86d3345-ec80-465a-95fd-98fdf644c947'
            : widget.coffeeshops.imgMenu.toString();
    final imgOne = widget.coffeeshops.imgPrimUrl!.isEmpty
        ? 'https://firebasestorage.googleapis.com/v0/b/coffee-fire.appspot.com/o/no-image-icon-23494.png?alt=media&token=b86d3345-ec80-465a-95fd-98fdf644c947'
        : widget.coffeeshops.imgPrimUrl!.contains(RegExp(
                'https://b.zmtcdn.com/images/res_avatar_476_320_1x_new.png'))
            ? 'https://firebasestorage.googleapis.com/v0/b/coffee-fire.appspot.com/o/no-image-icon-23494.png?alt=media&token=b86d3345-ec80-465a-95fd-98fdf644c947'
            : widget.coffeeshops.imgPrimUrl.toString();
    final imgTwo = widget.coffeeshops.imgSecUrl!.isEmpty
        ? 'https://firebasestorage.googleapis.com/v0/b/coffee-fire.appspot.com/o/no-image-icon-23494.png?alt=media&token=b86d3345-ec80-465a-95fd-98fdf644c947'
        : widget.coffeeshops.imgSecUrl!.contains(RegExp(
                'https://b.zmtcdn.com/images/res_avatar_476_320_1x_new.png'))
            ? 'https://firebasestorage.googleapis.com/v0/b/coffee-fire.appspot.com/o/no-image-icon-23494.png?alt=media&token=b86d3345-ec80-465a-95fd-98fdf644c947'
            : widget.coffeeshops.imgSecUrl.toString();

    List<String> images = [
      imgMenu,
      imgOne,
      imgTwo,
    ];

    var mediaQuery = MediaQuery.of(context);
    var tText = Theme.of(context).textTheme;
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;
    final double height = MediaQuery.of(context).size.height;

    // ignore: unused_local_variable
    double widht = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Tumpukan foto dan Container Nama Toko

              Stack(alignment: Alignment.bottomCenter, children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.38,
                  width: double.infinity,
                  child: ExtendedImage.network(
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
                    fit: BoxFit.contain,
                    filterQuality: FilterQuality.high,

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
                                        .startsWith(
                                            RegExp('Starbucks Coffee Company'))
                                    ? BoxFit.cover
                                    : widget.coffeeshops.chainName!
                                            .toString()
                                            .startsWith(RegExp('Maxx Coffee'))
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
                ),
                Positioned(
                  left: 10,
                  top: 15,
                  child: Container(
                    width: 80,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        hoverColor: black,
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          size: 27,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop(DetailP.routeName);
                        },
                      ),
                    ),
                  ),
                ),
              ]),

              Container(
                height: height * 0.13,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 28, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 0.2,
                        color: isDarkMode ? white : black,
                      ),

                      Flexible(
                        child: Text(
                          widget.coffeeshops.name.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .headline3!
                              .copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                      Text(
                        widget.coffeeshops.tags!,
                        style: tText.bodyText2!.copyWith(
                            color: isDarkMode
                                ? Colors.white54
                                : Colors.black.withOpacity(0.7)),
                      ),

                      const Text(''
                          // widget.coffeeshops.text!.startsWith('Not rated')
                          //     ? ''
                          //     : widget.coffeeshops.text.toString(),
                          // style: tText.bodyText2!.copyWith(
                          //     fontWeight: FontWeight.bold,
                          //     color: widget.coffeeshops.text!
                          //             .contains('Excellent')
                          //         ? Colors.green
                          //         : widget.coffeeshops.text!.contains('Average')
                          //             ? Colors.grey
                          //             : widget.coffeeshops.text!
                          //                     .startsWith('Good')
                          //                 ? Colors.lightBlue
                          //                 : widget.coffeeshops.text!
                          //                         .startsWith('Very Good')
                          //                     ? Colors.lightGreen
                          //                     : Colors.red),
                          ),

                      // Text(
                      //   widget.coffeeshops.status!.contains('Open')
                      //       ? 'Open Now'
                      //       : 'Closed',
                      //   style: tText.bodyText2!.copyWith(
                      //       color: widget.coffeeshops.status!.contains('Open')
                      //           ? Colors.green
                      //           : Colors.red),
                      // ),

                      Container(
                        color: isDarkMode ? white : black,
                        height: 0.2,
                      ),

                      // Text(
                      //   coffeeshops.status,
                      //   style: Theme.of(context).textTheme.bodyText2,
                      //   selectionColor: Colors.red,
                      // ),
                    ],
                  ),
                ),
              ),

              // AddImage(images: images),

              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 28, vertical: 5),
                      child: Text(
                        'Hours',
                        style: tText.headline4!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Card(
                        color: isDarkMode ? Colors.black26 : cardbg,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Center(
                                    widthFactor: 3.5,
                                    child: Text(
                                      widget.coffeeshops.timing!.isEmpty
                                          ? 'Data not available'
                                          : widget.coffeeshops.timing!
                                              .toString(),
                                      style: tText.bodyText2!.copyWith(
                                          fontSize: 10,
                                          color: isDarkMode
                                              ? Colors.white
                                              : Colors.black.withOpacity(0.7)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 28,
                ),
                child: Text(
                  'Maps',
                  style: tText.headline4!.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 220,
                    width: 344,
                    child: Stack(
                      children: [
                        Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3)),
                          child: MapboxMap(
                            accessToken: dotenv.env['MAPBOX_ACCESS_TOKEN'],
                            styleString: isDarkMode
                                ? StyleOfMap.mapLight
                                : StyleOfMap.mapDark,
                            onMapCreated: _onMapCreated,
                            onStyleLoadedCallback: _onStyleLoadedCallback,
                            initialCameraPosition: _placeCamera,
                            trackCameraPosition: true,
                            minMaxZoomPreference:
                                const MinMaxZoomPreference(12, 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Card(
                        color: isDarkMode ? Colors.black26 : cardbg,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Container(
                          height: 80,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Stack(
                              children: [
                                // Padding(
                                //   padding: const EdgeInsets.only(left: 15),
                                //   child: Positioned(
                                //     right: 2,
                                //     bottom: 20,
                                //     child: Align(
                                //       alignment: Alignment.topRight,
                                //       child: IconButton(
                                //         onPressed: () {
                                //           Clipboard.setData(
                                //             ClipboardData(
                                //                 text:
                                //                     widget.coffeeshops.mapUrl),
                                //           );
                                //         },
                                //         icon: const Icon(
                                //           Icons.copy,
                                //           size: 20,
                                //         ),
                                //       ),
                                //     ),
                                //   ),
                                // ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(right: 5, top: 5),
                                  child: Positioned(
                                    left: 5,
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            widget.coffeeshops.address!,
                                            style: tText.bodyText2,
                                          ),
                                          Flexible(
                                            child: Text(
                                              'DKI ${widget.coffeeshops.city!}',
                                              style: tText.bodyText2,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 28,
                ),
                child: Text(
                  'Contact',
                  style: tText.headline4!.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Card(
                        color: isDarkMode ? Colors.black26 : cardbg,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Container(
                          height: 150,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 8, right: 10, bottom: 5),
                            child: Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 2, right: 5, top: 5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Image(
                                            image: const AssetImage(iNsta96),
                                            width: 25,
                                            height: 25,
                                            color: isDarkMode ? white : black,
                                          ),
                                          Expanded(
                                            child: Center(
                                              widthFactor: 3.5,
                                              child: Text(widget.coffeeshops
                                                      .social!.isEmpty
                                                  ? '-'
                                                  : widget.coffeeshops.social!
                                                          .toString()
                                                          .startsWith(
                                                              RegExp('@'))
                                                      ? widget
                                                          .coffeeshops.social!
                                                          .toString()
                                                      : '@${widget.coffeeshops.social!.toString()}'),
                                            ),
                                          ),
                                        ],
                                      ),
                                      // SizedBox(
                                      //   height: 0.15,
                                      //   width: double.infinity,
                                      //   child: Padding(
                                      //     padding: const EdgeInsets.only(
                                      //         left: 30, right: 15),
                                      //     child: Container(
                                      //       color: isDarkMode
                                      //           ? white
                                      //           : Colors.black,
                                      //     ),
                                      //   ),
                                      // ),
                                      // Row(
                                      //   crossAxisAlignment:
                                      //       CrossAxisAlignment.center,
                                      //   mainAxisAlignment:
                                      //       MainAxisAlignment.start,
                                      //   children: [
                                      //     const Icon(
                                      //       Icons.link,
                                      //       size: 25,
                                      //     ),
                                      //     Flexible(
                                      //       child: Center(
                                      //         widthFactor: 3.5,
                                      //         child: Text(widget
                                      //             .coffeeshops.localityVerbose!
                                      //             .toString()),
                                      //       ),
                                      //     ),
                                      //   ],
                                      // ),
                                      SizedBox(
                                        height: 0.15,
                                        width: double.infinity,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 30, right: 15),
                                          child: Container(
                                            color: isDarkMode
                                                ? cardbg
                                                : Colors.black,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const Icon(
                                            Icons.phone,
                                            size: 25,
                                          ),
                                          Expanded(
                                            child: Center(
                                                widthFactor: 3.5,
                                                child: Text(widget
                                                    .coffeeshops.phones!)),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 28, vertical: 5),
                child: Text(
                  'Menu & Images',
                  style: tText.headline4!.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 220,
                    width: 350,
                    child: Stack(
                      children: [
                        CarouselSlider(
                          items: List<Widget>.generate(
                            widget.coffeeshops.isChain == true
                                ? widget.coffeeshops.chainName!
                                        .startsWith('Starbucks Coffee Company')
                                    ? menuStarbucks.length
                                    : widget.coffeeshops.chainName!
                                            .startsWith('Maxx Coffee')
                                        ? menuMaxx.length
                                        : widget.coffeeshops.chainName!
                                                .startsWith('Fore Coffee')
                                            ? menuFore.length
                                            : images.length
                                : images.length,
                            (index) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Expanded(
                                child: Stack(
                                  alignment: Alignment.centerLeft,
                                  children: [
                                    SafeArea(
                                      child: Container(
                                        clipBehavior: Clip.antiAlias,
                                        height: 220,
                                        width: 220,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(3),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                widget.coffeeshops.isChain! ==
                                                        true
                                                    ? widget.coffeeshops
                                                            .chainName!
                                                            .startsWith(
                                                                'Starbucks Coffee Company')
                                                        ? menuStarbucks[index]
                                                        : widget.coffeeshops
                                                                .chainName!
                                                                .startsWith(
                                                                    'Maxx Coffee')
                                                            ? menuMaxx[index]
                                                            : widget.coffeeshops
                                                                    .chainName!
                                                                    .startsWith(
                                                                        'Fore Coffee')
                                                                ? menuFore[
                                                                    index]
                                                                : images[index]
                                                    : images[index],
                                              ),
                                              filterQuality: FilterQuality.high,
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          options: CarouselOptions(
                              height: 160,
                              viewportFraction: 0.5,
                              enableInfiniteScroll: false,
                              scrollDirection: Axis.horizontal,
                              onPageChanged: (int index,
                                  CarouselPageChangedReason reason) async {
                                setState(() {
                                  pageIndex = index;
                                });
                              }),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // SliverPadding(
              //   padding:
              //       const EdgeInsets.symmetric(horizontal: 28, vertical: 5),
              //   sliver: SliverToBoxAdapter(
              //     child: FeaturedWidg(
              //       title: "Featured Partners",
              //       press: () {},
              //       tText: tText,
              //     ),
              //   ),
              // ),
              // SliverToBoxAdapter(
              //   child: SingleChildScrollView(
              //     scrollDirection: Axis.horizontal,
              //     child: Row(
              //       children: [
              //         BlocBuilder<CoffeeshopsBloc, CoffeeshopsState>(
              //           builder: (context, state) {
              //             if (state is CoffeeshopLoading) {
              //               return const Center(
              //                 child: LoadingWidgetWave(),
              //               );
              //             }
              //             if (state is CoffeeshopLoaded) {
              //               return ListView.builder(
              //                 itemCount: state.coffeeshops.length,
              //                 itemBuilder: ((context, index) {
              //                   if (state.coffeeshops[index].chainName
              //                       .toString()
              //                       .contains(RegExp(widget
              //                           .coffeeshops.chainName
              //                           .toString()))) {
              //                     return Padding(
              //                       padding: const EdgeInsets.only(left: 20),
              //                       child: ListFeatured(
              //                           chainedCshop: state.coffeeshops[index],
              //                           tText: tText,
              //                           isDarkMode: isDarkMode,
              //                           location: state
              //                               .coffeeshops[index].locality
              //                               .toString(),
              //                           callBack: () {},
              //                           img: state.coffeeshops[index].imgPrimUrl
              //                               .toString(),
              //                           title: state.coffeeshops[index].name
              //                               .toString()),
              //                     );
              //                   } else {
              //                     return Container();
              //                   }
              //                 }),
              //               );
              //             } else {
              //               return Container();
              //             }
              //           },
              //         ),
              //       ],
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }

  bool get wantKeepAlive => true;
}

class ListFeatured extends StatelessWidget {
  const ListFeatured({
    Key? key,
    required this.tText,
    required this.isDarkMode,
    required this.location,
    required this.callBack,
    required this.img,
    required this.title,
    required this.chainedCshop,
  }) : super(key: key);

  final TextTheme tText;
  final bool isDarkMode;
  final String title, img, location;
  final VoidCallback callBack;
  final Coffeeshops chainedCshop;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(6)),
      onTap: callBack,
      child: SizedBox(
        width: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1.25,
              child: Image.network(img),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: tText.headline3!
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            Text(
              location,
              maxLines: 1,
              style: tText.bodyText2!.copyWith(
                color:
                    isDarkMode ? Colors.white54 : Colors.black.withOpacity(0.7),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
