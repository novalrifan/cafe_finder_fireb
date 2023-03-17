import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/customer_models.dart';
import 'base_customer_repo.dart';

class CustomerRepo extends BaseCustomerRepo {
  final FirebaseFirestore _firebaseFirestore;

  CustomerRepo({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  // @override
  // Future<void> addUser(Coffeeshop coffeeshop) async {
  //   await _firebaseFirestore.collection('users').add(coffeeshop.toDocument());
  // }

  // @override
  // Future<void> editPlaceOpeningHours(List<OpeningHours> openingHours) async {
  //   await _firebaseFirestore.collection('users').doc().update(({
  //         'openingHours': openingHours.map((openingHour) {
  //           return openingHour.toDocument();
  //         }).toList(),
  //       }));
  // }

  // @override
  // Future<void> editPlaceSettings(Coffeeshop coffeeshop) async {
  //   await _firebaseFirestore
  //       .collection('users')
  //       .doc()
  //       .update(coffeeshop.toDocument());
  // }

  @override
  Stream<List<Customer>> getUser() {
    return _firebaseFirestore.collection('users').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Customer.fromSnapshotP(doc)).toList();
    });
  }
}
