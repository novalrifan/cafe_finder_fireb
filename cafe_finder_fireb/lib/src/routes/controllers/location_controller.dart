// ignore_for_file: no_leading_underscores_for_local_identifiers, unused_local_variable

import 'package:cafe_finder_fireb/main.dart';
import 'package:cafe_finder_fireb/src/common_widgets/animation/loading_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import 'package:mapbox_gl/mapbox_gl.dart';

import '../../features/core/repository/auth_/authuser.dart';

class Splash extends StatefulWidget {
  static const String routeName = 'splashcontroller';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const Splash(),
      settings: const RouteSettings(name: routeName),
    );
  }

  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    initializeLocationAndSave();
  }

  void initializeLocationAndSave() async {
    final userData = await FirebaseFirestore.instance
        .collection('users')
        .doc(Auth().currentUser!.email)
        .get();
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();

      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    Position _position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    LatLng currentLatlng = LatLng(_position.latitude, _position.longitude);
    List<Placemark> placemark =
        await placemarkFromCoordinates(_position.latitude, _position.longitude);

    Placemark place = placemark[0];

    sharedPreferences.setDouble('latitude', _position.latitude);
    sharedPreferences.setDouble('longitude', _position.longitude);
    sharedPreferences.setString('city', '${place.subAdministrativeArea}');
    sharedPreferences.setString('locality', '${place.locality}');

    sharedPreferences.setDouble(
        'weighted_facility', userData.get('w_facility'));
    sharedPreferences.setDouble(
        'weighted_distance', userData.get('w_distance'));
    sharedPreferences.setDouble('weighted_price', userData.get('w_price'));
    sharedPreferences.setDouble('weighted_rate', userData.get('w_rate'));

    // ignore: use_build_context_synchronously
    Navigator.pushNamedAndRemoveUntil(
      context,
      '/',
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: Center(child: LoadingWidgetWave()),
    );
  }
}
