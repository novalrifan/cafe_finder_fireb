// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Customer extends Equatable {
  final String? id;
  final String? name;

  final String? email;
  final String? providers;

  const Customer({
    this.id,
    this.name,
    this.email,
    this.providers,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        providers,
      ];

  Customer copyWith({
    String? id,
    String? name,
    String? email,
    String? providers,
  }) {
    return Customer(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      providers: providers ?? this.providers,
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      'id': id ?? '',
      'name': name ?? '',
      // 'imageUrl': imageUrl ?? '',
      'email': email ?? '',
      'providers': providers ?? '',
    };
  }

  factory Customer.fromSnapshotP(DocumentSnapshot<Map<String, dynamic>> snap) {
    var idk = snap.data().toString();
    var exp = snap.data()!;
    return Customer(
      id: idk.contains('id') ? snap.id : '',
      name: idk.contains('name') ? exp['name'] : '',
      // imageUrl: exp['img_prim_url'],
      email: exp['email'],
      providers: exp['loginWith'],
    );
  }

  // static List<Coffeeshop> coffeeshops = [
  //   Coffeeshop(
  //       id: '1',
  //       name: 'Kelink Kupi',
  //       imageUrl:
  //           'https://www.google.com/maps/uv?pb=!1s0x2e69f54e8e854fad%3A0x1187dba199ccf363!3m1!7e115!4shttps%3A%2F%2Flh5.googleusercontent.com%2Fp%2FAF1QipOW1LAEMASQboUyFoHNXUGJ1yGgu5pusbaSfUzt%3Dw234-h176-k-no!5skelink%20kupi%20-%20Penelusuran%20Google!15sCgIgAQ&imagekey=!1e10!2sAF1QipOW1LAEMASQboUyFoHNXUGJ1yGgu5pusbaSfUzt&hl=id&sa=X&ved=2ahUKEwjF5KDg16j7AhVJzXMBHbR3CygQoip6BAhoEAM#',
  //       email: 'This is email',
  //       providers: const ['Signature Menus, Coffee, Non-Coffee'],
  //       categories: Category.categories,
  //       products: Product.products,
  //       openingHours: OpeningHours.openingHoursList),
  // ];
}
