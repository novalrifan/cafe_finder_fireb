import 'dart:convert';

import 'package:cafe_finder_fireb/main.dart';
import 'package:geocoding/geocoding.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

Placemark getAddressFromSharedPrefs() {
  return Placemark(
      subAdministrativeArea: sharedPreferences.getString('city'),
      locality: sharedPreferences.getString('locality'));
}

LatLng getLatLngFromSharedPrefs() {
  return LatLng(sharedPreferences.getDouble('latitude')!,
      sharedPreferences.getDouble('longitude')!);
}

Map getDecodedResponseFromSharedPrefs(int index) {
  String key = 'coffeeshops--$index';
  Map response = json.decode(sharedPreferences.getString(key)!);
  return response;
}

num getDistanceFromSharedPrefs(int index) {
  num distance = getDecodedResponseFromSharedPrefs(index)['distance'];
  return distance;
}

num getDurationFromSharedPrefs(int index) {
  num duration = getDecodedResponseFromSharedPrefs(index)['duration'];
  return duration;
}

Map getGeometryFromSharedPrefs(int index) {
  Map geometry = getDecodedResponseFromSharedPrefs(index)['geometry'];
  return geometry;
}
