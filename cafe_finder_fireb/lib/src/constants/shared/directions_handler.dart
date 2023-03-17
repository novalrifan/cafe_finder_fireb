import 'package:cafe_finder_fireb/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:mapbox_gl/mapbox_gl.dart';

import '../request/mapbox_request.dart';

Future<Map> getDirectionsAPIResponse(LatLng currentLatLng, int index) async {
  final documentSnap =
      await FirebaseFirestore.instance.collection('places').doc().get();
  final lat = documentSnap.data()!['latitude'];
  final lng = documentSnap.data()!['longitude'];

  final response = await getCyclingRouteUsingMapbox(currentLatLng,
      LatLng(double.parse(lat[index]), double.parse(lng[index])));
  Map geometry = response['routes'][0]['geometry'];
  num duration = response['routes'][0]['duration'];
  num distance = response['routes'][0]['distance'];

  Map modifiedResponse = {
    "geometry": geometry,
    "duration": duration,
    "distance": distance,
  };
  return modifiedResponse;
}

void saveDirectionsAPIResponse(int index, String response) {
  sharedPreferences.setString('coffeeshops--$index', response);
}
