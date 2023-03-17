import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cafe_finder_fireb/src/features/core/repository/store/base.dart';
import 'package:haversine_distance/haversine_distance.dart';

import 'package:mapbox_gl/mapbox_gl.dart';

import '../../../../constants/shared/shared_pref.dart';
import '../../models/coffeestore_model.dart';

class CoffeeRepo extends BaseRepo {
  final FirebaseFirestore _firebaseFirestore;
  LatLng latLng = getLatLngFromSharedPrefs();
  final haversineDistance = HaversineDistance();

  CoffeeRepo({
    FirebaseFirestore? firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<Coffeeshops>> getCoffeeshops() {
    return _firebaseFirestore.collection('places').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Coffeeshops.fromJson(doc)).toList();
    });
  }

  // Future<void> getByRate() async {
  //   await getCoffeeshops().first;
  //   _firebaseFirestore
  //       .collection('allplace')
  //       .orderBy('average', descending: true);
  // }
}
