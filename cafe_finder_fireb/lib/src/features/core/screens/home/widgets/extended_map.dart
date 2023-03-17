import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

import '../../../../../common_widgets/animation/loading_widget.dart';
import '../../../bloc/blocs.dart';
import '../map-page/carousel_card.dart';
import '../map-page/map_page.dart';

class Mapsss extends StatelessWidget {
  const Mapsss({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ByDistanceBloc, ByDistanceState>(
      builder: (context, state) {
        if (state is ByDistanceLoading) {
          return const Center(
            child: LoadingWidget(),
          );
        }
        if (state is ByDistanceLoaded) {
          for (int index = 0; index < state.coffeeshops.length; index++) {
            final distances =
                state.coffeeshops[index].distance ?? 0.0.toDouble();
            final newStateOfDistance = state.coffeeshops;

            if (distances < 2.0) {
              newStateOfDistance
                  .sort(((a, b) => a.distance!.compareTo(b.distance!)));

              // List carouselData = state.coffeeshops;
              // num distance = getDistanceFromSharedPrefs(index) / 1000;
              // num duration = getDurationFromSharedPrefs(index) / 60;
              // carouselData.add({
              //   'index': state.coffeeshops[index],
              //   'distance': distance,
              //   'duration': duration
              // });
              // carouselData.sort(((a, b) => a['duration'] < b['duration']));
              // Future<Map> modifiedResponse =
              //     getDirectionsAPIResponse(latLng, index);
              // saveDirectionsAPIResponse(index, json.encode(modifiedResponse));
              final List<CameraPosition> cameraP =
                  List<CameraPosition>.generate(
                      newStateOfDistance.length,
                      (index) => CameraPosition(
                          target: LatLng(
                              newStateOfDistance[index].latitude!.toDouble(),
                              newStateOfDistance[index].longitude!.toDouble()),
                          zoom: 16));
              final List<Widget> carouselItems = List<Widget>.generate(
                newStateOfDistance.length,
                (index) => carouselCard(
                  newStateOfDistance[index],
                  // carouselData[index]['distance'],
                  // carouselData[index]['duration'],
                ),
              );

              return MapOfPlace(
                coffeeshops: newStateOfDistance[index],
                cameraP: cameraP,
                carouselItems: carouselItems,
                // carouselD: carouselData,
              );
            }
          }
        } else {
          return Container();
        }
        return Container();
      },
    );
  }
}
