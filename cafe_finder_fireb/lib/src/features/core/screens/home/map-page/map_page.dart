// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cafe_finder_fireb/src/features/core/models/coffeestore_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

import 'package:cafe_finder_fireb/src/constants/shared/shared_pref.dart';

import 'package:cafe_finder_fireb/src/utils/theme/widgets_theme/map_box_theme.dart';

import '../../../../../constants/images_source.dart';

class MapOfPlace extends StatefulWidget {
  final List<CameraPosition> cameraP;
  final Coffeeshops coffeeshops;
  final List<Widget> carouselItems;
  // final List carouselD;

  const MapOfPlace({
    Key? key,
    required this.coffeeshops,
    required this.cameraP,
    required this.carouselItems,
    // required this.carouselD,
  }) : super(key: key);

  @override
  State<MapOfPlace> createState() => _MapOfPlaceState();
}

class _MapOfPlaceState extends State<MapOfPlace> with TickerProviderStateMixin {
  LatLng currentLoc = getLatLngFromSharedPrefs();

  late CameraPosition _initialCameraPostition;
  late List<CameraPosition> _placeCamera;
  late MapboxMapController controller;
  List<Widget> _items = [];

  int pageIndex = 0;
  bool accessed = false;

  @override
  void initState() {
    super.initState();
    _initialCameraPostition = CameraPosition(target: currentLoc, zoom: 15.5);
    _placeCamera = widget.cameraP;
    _items = widget.carouselItems;
  }

  // _addSourceLineLayer(int index, bool removeLayer) async {
  //   controller
  //       .animateCamera(CameraUpdate.newCameraPosition(_placeCamera[index]));
  //   Map geometry = getGeometryFromSharedPrefs(widget.carouselD[index]['index']);
  //   final _fills = {
  //     "type": "FeatureCollection",
  //     "features": [
  //       {
  //         "type": "Feature",
  //         "id": 0,
  //         "properties": <String, dynamic>{},
  //         "geometry": geometry,
  //       },
  //     ],
  //   };
  //   // Remove lineLayer and source if it exists
  //   if (removeLayer == true) {
  //     await controller.removeLayer("lines");
  //     await controller.removeSource("fills");
  //   }

  //   // Add new source and lineLayer
  //   await controller.addSource("fills", GeojsonSourceProperties(data: _fills));
  //   await controller.addLineLayer(
  //     "fills",
  //     "lines",
  //     LineLayerProperties(
  //       lineColor: Colors.green.toHexStringRGB(),
  //       lineCap: "round",
  //       lineJoin: "round",
  //       lineWidth: 2,
  //     ),
  //   );
  // }

  _onMapCreated(MapboxMapController controller) async {
    this.controller = controller;
  }

  _onStyleLoadedCallback() async {
    for (CameraPosition place in _placeCamera) {
      await controller.addSymbol(
        SymbolOptions(
          geometry: place.target,
          iconSize: 0.25,
          iconImage: markIcon,
        ),
      );
    }
    // _addSourceLineLayer(0, false);
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: MapboxMap(
                styleString:
                    isDarkMode ? StyleOfMap.mapDark : StyleOfMap.mapLight,
                accessToken: dotenv.env['MAPBOX_ACCESS_TOKEN'],
                onMapCreated: _onMapCreated,
                initialCameraPosition: _placeCamera[1],
                myLocationEnabled: true,
                onStyleLoadedCallback: _onStyleLoadedCallback,
                myLocationTrackingMode: MyLocationTrackingMode.TrackingGPS,
                minMaxZoomPreference: const MinMaxZoomPreference(10, 18),
              ),
            ),
            CarouselSlider(
              items: _items,
              options: CarouselOptions(
                height: 100,
                viewportFraction: 0.6,
                initialPage: 0,
                enableInfiniteScroll: false,
                scrollDirection: Axis.horizontal,
                onPageChanged:
                    (int index, CarouselPageChangedReason reason) async {
                  setState(() {
                    pageIndex = index;
                  });
                  controller.animateCamera(
                      CameraUpdate.newCameraPosition(_placeCamera[index]));
                  // _addSourceLineLayer(index, true);
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: isDarkMode ? Colors.blueGrey : Colors.black54,
        onPressed: () {
          controller.animateCamera(
              CameraUpdate.newCameraPosition(_initialCameraPostition));
        },
        child: const Icon(
          Icons.my_location_rounded,
        ),
      ),
    );
  }

  bool get wantKeepAlive => true;
}
