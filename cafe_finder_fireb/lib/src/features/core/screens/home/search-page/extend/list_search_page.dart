import 'package:cafe_finder_fireb/src/constants/color.dart';
import 'package:cafe_finder_fireb/src/constants/images_source.dart';
import 'package:flutter/material.dart';
import 'package:haversine_distance/haversine_distance.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

import '../../../../../../constants/shared/shared_pref.dart';
import '../../../../models/coffeestore_model.dart';

// ignore: must_be_immutable
class SearchList extends StatelessWidget {
  SearchList({
    Key? key,
    required this.coffeeshops,
  }) : super(key: key);

  final Coffeeshops coffeeshops;
  LatLng latLng = getLatLngFromSharedPrefs();
  final haversineDistance = HaversineDistance();
  @override
  Widget build(BuildContext context) {
    var currentlatLng = Location(latLng.latitude, latLng.longitude);
    var placelatLng = Location(
        coffeeshops.latitude!.toDouble(), coffeeshops.longitude!.toDouble());
    var distances =
        '${haversineDistance.haversine(currentlatLng, placelatLng, Unit.KM).toStringAsFixed(1)} km';
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/coffeeshop-detailsnew',
          arguments: coffeeshops,
        );
      },
      child: ListTile(
        title: Text(
          coffeeshops.name!,
          maxLines: 1,
          overflow: TextOverflow.visible,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        subtitle: Text(
          coffeeshops.tags!,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context)
              .textTheme
              .bodyText2!
              .copyWith(fontSize: 8.5, fontStyle: FontStyle.italic),
        ),
        leading: const CircleAvatar(
          backgroundColor: tSecondary,
          backgroundImage: AssetImage(markIcon),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              coffeeshops.locality!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            Text(distances)
          ],
        ),
      ),
    );
  }
}
