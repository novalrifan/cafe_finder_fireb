import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? id;
  final String fullName;
  final String email;
  final String adderss;
  final String city;
  final String country;
  final String zipcode;
  const User({
    this.id,
    this.fullName = '',
    this.email = '',
    this.adderss = '',
    this.city = '',
    this.country = '',
    this.zipcode = '',
  });

  User copyWith({
    String? id,
    String? fullName,
    String? email,
    String? adderss,
    String? city,
    String? country,
    String? zipcode,
  }) {
    return User(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      adderss: adderss ?? this.adderss,
      city: city ?? this.city,
      country: country ?? this.country,
      zipcode: zipcode ?? this.zipcode,
    );
  }

  factory User.fromSnapshot(DocumentSnapshot snap) {
    return User(
      id: snap.id,
      fullName: snap['fullName'],
      email: snap['email'],
      adderss: snap['adderss'],
      city: snap['city'],
      country: snap['country'],
      zipcode: snap['zipcode'],
    );
  }

  Map<String, Object> toDocument() {
    return {
      'fullName': fullName,
      'email': email,
      'adderss': adderss,
      'city': city,
      'country': country,
      'zipcode': zipcode,
    };
  }

  @override
  List<Object?> get props => [
        id,
        fullName,
        email,
        adderss,
        city,
        country,
        zipcode,
      ];
}
