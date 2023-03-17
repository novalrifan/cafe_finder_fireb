import 'package:cafe_finder_fireb/src/constants/images_source.dart';
import 'package:flutter/material.dart';
import 'package:haversine_distance/haversine_distance.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

import '../../../../../constants/shared/shared_pref.dart';
import '../../../models/coffeestore_model.dart';

LatLng latLng = getLatLngFromSharedPrefs();
HaversineDistance haversineDistance = HaversineDistance();
Widget carouselCard(
  Coffeeshops coffeeshops,
) {
  var currentlatLng = Location(latLng.latitude, latLng.longitude);
  final placelatLng = Location(
      coffeeshops.latitude!.toDouble(), coffeeshops.longitude!.toDouble());
  // ignore: unused_local_variable
  var distances =
      '${haversineDistance.haversine(currentlatLng, placelatLng, Unit.KM).toStringAsFixed(1)} km';
  return Card(
    clipBehavior: Clip.antiAlias,
    child: Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ignore: prefer_const_constructors
          CircleAvatar(
            backgroundColor: Colors.black45,
            backgroundImage: const NetworkImage(noImage),
            radius: 20,
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    coffeeshops.name!,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                ),
                Text(
                  coffeeshops.distance!.toDouble().toStringAsFixed(1),
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 12),
                ),
                // const SizedBox(height: 5),
                // Text(
                //   distances,
                //   style: const TextStyle(color: Colors.tealAccent, fontSize: 8),
                // )
              ],
            ),
          )
        ],
      ),
    ),
  );
}
