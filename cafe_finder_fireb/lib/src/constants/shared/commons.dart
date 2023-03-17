// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:mapbox_gl/mapbox_gl.dart';

// import '../../features/core/models/coffeestore_model.dart';

// Future<LatLng> getLatLngFromPlacesData(int index) async {
//   var querySnapshot =
//       await FirebaseFirestore.instance.collection('allplace').get();

//   Coffeeshops coffeeshop = Coffeeshops.fromJson(querySnapshot.docs[index]);
//   return LatLng(
//       coffeeshop.latitude!.toDouble(), coffeeshop.longitude!.toDouble());
// }
