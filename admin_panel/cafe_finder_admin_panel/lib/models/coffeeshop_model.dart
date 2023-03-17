// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

import 'models.dart';

class Coffeeshop extends Equatable {
  final String? id;
  final String? name;
  final String? category;
  final String? description;
  final String? tags;
  final String? imageUrl;
  final String? locality;

  final List<OpeningHours>? openingHours;

  const Coffeeshop(
      {this.id,
      this.name,
      this.description,
      this.tags,
      this.imageUrl,
      this.locality,
      this.category,
      this.openingHours});

  @override
  List<Object?> get props =>
      [id, name, description, tags, openingHours, imageUrl, locality, category];

  Coffeeshop copyWith({
    String? id,
    String? name,
    String? description,
    String? tags,
    String? imageUrl,
    String? locality,
    String? category,
    List<OpeningHours>? openingHours,
  }) {
    return Coffeeshop(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      tags: tags ?? this.tags,
      openingHours: openingHours ?? this.openingHours,
      imageUrl: imageUrl ?? this.imageUrl,
      locality: locality ?? this.locality,
      category: category ?? this.category,
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      'id': id ?? '',
      'name': name ?? '',
      // 'imageUrl': imageUrl ?? '',
      'description': description ?? '',
      'tags': tags ?? '',
      'img_prim_url': imageUrl ?? '',
      'locality': locality ?? '',
      'category ': category ?? '',
      'openingHours': openingHours!.map(
        (openingHour) {
          return openingHour.toDocument();
        },
      ).toList(),
    };
  }

  factory Coffeeshop.fromSnapshotP(
      DocumentSnapshot<Map<String, dynamic>> snap) {
    var idk = snap.data().toString();
    var exp = snap.data()!;
    return Coffeeshop(
        id: idk.contains('id') ? snap.id : '',
        name: idk.contains('name') ? exp['name'] : '',
        // imageUrl: exp['img_prim_url'],
        description: exp['description'] ?? '',
        tags: exp['tags'] ?? '',
        imageUrl: exp['img_prim_url'],
        category: exp['category'] ?? '',
        locality: exp['locality'] ?? '-',
        openingHours: OpeningHours.openingHoursList);
  }

  // static List<Coffeeshop> coffeeshops = [
  //   Coffeeshop(
  //       id: '1',
  //       name: 'Kelink Kupi',
  //       imageUrl:
  //           'https://www.google.com/maps/uv?pb=!1s0x2e69f54e8e854fad%3A0x1187dba199ccf363!3m1!7e115!4shttps%3A%2F%2Flh5.googleusercontent.com%2Fp%2FAF1QipOW1LAEMASQboUyFoHNXUGJ1yGgu5pusbaSfUzt%3Dw234-h176-k-no!5skelink%20kupi%20-%20Penelusuran%20Google!15sCgIgAQ&imagekey=!1e10!2sAF1QipOW1LAEMASQboUyFoHNXUGJ1yGgu5pusbaSfUzt&hl=id&sa=X&ved=2ahUKEwjF5KDg16j7AhVJzXMBHbR3CygQoip6BAhoEAM#',
  //       description: 'This is description',
  //       tags: const ['Signature Menus, Coffee, Non-Coffee'],
  //       categories: Category.categories,
  //       products: Product.products,
  //       openingHours: OpeningHours.openingHoursList),
  // ];
}
