import 'package:cafe_finder_admin_panel/models/opening_hours.dart';
import 'package:cafe_finder_admin_panel/models/coffeeshop_model.dart';
import 'package:cafe_finder_admin_panel/repositories/places/base_places_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PlaceRepo extends BasePlacesRepo {
  final FirebaseFirestore _firebaseFirestore;

  PlaceRepo({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Future<void> addPlace(Coffeeshop coffeeshop) async {
    await _firebaseFirestore.collection('places').add(coffeeshop.toDocument());
  }

  @override
  Future<void> editPlaceOpeningHours(List<OpeningHours> openingHours) async {
    await _firebaseFirestore.collection('places').doc().update(({
          'openingHours': openingHours.map((openingHour) {
            return openingHour.toDocument();
          }).toList(),
        }));
  }

  @override
  Future<void> editPlaceSettings(Coffeeshop coffeeshop) async {
    await _firebaseFirestore
        .collection('places')
        .doc()
        .update(coffeeshop.toDocument());
  }

  @override
  Stream<List<Coffeeshop>> getPlaces() {
    return _firebaseFirestore.collection('places').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Coffeeshop.fromSnapshotP(doc)).toList();
    });
  }
}
