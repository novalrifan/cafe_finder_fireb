import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:haversine_distance/haversine_distance.dart';

import 'package:mapbox_gl/mapbox_gl.dart';

import '../../../../constants/shared/shared_pref.dart';
import '../../models/coffeestore_model.dart';
import 'base2.dart';

class CoffeeRepo2 extends BaseRepo2 {
  final FirebaseFirestore _firebaseFirestore;
  LatLng latLng = getLatLngFromSharedPrefs();
  final haversineDistance = HaversineDistance();

  CoffeeRepo2({
    FirebaseFirestore? firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<Coffeeshops>> getCoffeeshop2() {
    return _firebaseFirestore
        .collection('places')
        .orderBy('average', descending: true)
        .limit(20)
        .snapshots()
        .map((snapshot) {
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
