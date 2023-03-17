// ignore_for_file: prefer_collection_literals, unnecessary_new, unnecessary_this

import 'package:cafe_finder_fireb/src/constants/images_source.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:haversine_distance/haversine_distance.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

import '../../../constants/shared/shared_pref.dart';

LatLng current = getLatLngFromSharedPrefs();
final haversineDistance = HaversineDistance();

class Coffeeshops {
  String? id;
  String? name;
  String? description;
  // String? url;
  String? tags;
  String? address;
  String? locality;
  String? city;

  num? latitude;
  num? longitude;

  String? localityVerbose;

  String? phones;

  // String? category;
  num? count;
  num? average;
  bool? isChain;
  String? chainName;

  String? imgPrimUrl;

  String? imgSecUrl;

  num? forTwo;

  String? imgMenu;
  String? timing;

  num? distance;
  String? social;
  num? cFaciility;
  num? cPrice;
  num? cDistance;
  num? cRate;
  bool? wifi;
  bool? ac;
  bool? livem;
  num? smoke;

  Coffeeshops({
    this.id,
    this.name,
    this.description,
    this.tags,
    this.address,
    this.locality,
    this.city,
    this.latitude,
    this.longitude,
    this.localityVerbose,
    this.phones,
    this.count,
    this.average,
    this.isChain,
    this.chainName,
    this.imgPrimUrl,
    this.imgSecUrl,
    this.forTwo,
    this.imgMenu,
    this.distance,
    this.timing,
    this.social,
    this.cFaciility,
    this.ac,
    this.wifi,
    this.livem,
    this.smoke,
    this.cDistance,
    this.cPrice,
    this.cRate,
  });

  factory Coffeeshops.fromJson(DocumentSnapshot<Map<String, dynamic>> load) {
    final reload = load.data().toString();

    final explode = load.data()!;

    return Coffeeshops(
        id: reload.contains('id') ? load.id : '',
        name: reload.contains('name') ? explode['name'] : '',
        description:
            reload.contains('description') ? explode['description'] : '',
        tags: reload.contains('tags') ? explode['tags'] : '',
        address: reload.contains('address') ? explode['address'] : '',
        locality: reload.contains('locality') ? explode['locality'] : '',
        city: reload.contains('city') ? explode['city'] : '',
        latitude: (explode['latitude'] as num? ?? 0.0).toDouble(),
        longitude: (explode['longitude'] as num? ?? 0.0).toDouble(),
        localityVerbose: reload.contains('locality_verbose')
            ? explode['locality_verbose']
            : '',
        phones: reload.contains('phones') ? explode['phones'] : '',
        count: (explode['count'] as num? ?? 0).toInt(),
        average: (explode['average'] as num? ?? 0.0).toDouble(),
        social: reload.contains('twitter') ? explode['twitter'] : '',
        imgPrimUrl:
            reload.contains('img_prim_url') ? explode['img_prim_url'] : noImage,
        imgSecUrl:
            reload.contains('img_sec_url') ? explode['img_sec_url'] : noImage,
        forTwo: (explode['for_two'] as num? ?? 0.0).toDouble(),
        imgMenu: reload.contains('img_menu') ? explode['img_menu'] : noImage,
        isChain: (explode['is_chain'] as bool? ?? false),
        chainName: reload.contains('chain_name') ? explode['chain_name'] : '',
        timing: reload.contains('timing') ? explode['timing'] : '',
        distance: haversineDistance.haversine(
            Location(current.latitude.toDouble(), current.longitude.toDouble()),
            Location(((explode['latitude'] as num?) ?? 0.0).toDouble(),
                ((explode['longitude'] as num?) ?? 0.0).toDouble()),
            Unit.METER),

        // nilai bobot fasilitas
        cFaciility: (explode['ac'] ?? false == true) &&
                (explode['wifi'] ?? false == true) &&
                (explode['live_music'] ?? false == true) &&
                ((explode['smoking_area'] as num? ?? 0.0).toDouble() != 0)
            ? 50
            : (explode['ac'] ?? false == false) &&
                    (explode['wifi'] ?? false == true) &&
                    (explode['live_music'] ?? false == true) &&
                    ((explode['smoking_area'] as num? ?? 0.0).toDouble() != 0)
                ? 30
                : (explode['ac'] ?? false == true) &&
                        (explode['wifi'] ?? false == false) &&
                        (explode['live_music'] ?? false == true) &&
                        ((explode['smoking_area'] as num? ?? 0.0).toDouble() !=
                            0)
                    ? 30
                    : (explode['ac'] ?? false == true) &&
                            (explode['wifi'] ?? false == true) &&
                            (explode['live_music'] ?? false == false) &&
                            ((explode['smoking_area'] as num? ?? 0.0).toDouble() !=
                                0)
                        ? 30
                        : (explode['ac'] ?? false == true) &&
                                (explode['wifi'] ?? false == true) &&
                                (explode['live_music'] ?? false == true) &&
                                ((explode['smoking_area'] as num? ?? 0.0).toDouble() ==
                                    0)
                            ? 30
                            : (explode['ac'] ?? false == false) &&
                                    (explode['wifi'] ?? false == false) &&
                                    (explode['live_music'] ?? false == true) &&
                                    ((explode['smoking_area'] as num? ?? 0.0).toDouble() ==
                                        0)
                                ? 10
                                : (explode['ac'] ?? false == true) &&
                                        (explode['wifi'] ?? false == false) &&
                                        (explode['live_music'] ??
                                            false == false) &&
                                        ((explode['smoking_area'] as num? ?? 0.0).toDouble() ==
                                            0)
                                    ? 10
                                    : (explode['ac'] ?? false == false) &&
                                            (explode['wifi'] ??
                                                false == true) &&
                                            (explode['live_music'] ??
                                                false == false) &&
                                            ((explode['smoking_area'] as num? ?? 0.0).toDouble() ==
                                                0)
                                        ? 10
                                        : 0,

        // nilai bobot jarak
        cDistance: (haversineDistance.haversine(Location(current.latitude.toDouble(), current.longitude.toDouble()), Location(((explode['latitude'] as num?) ?? 0.0).toDouble(), ((explode['longitude'] as num?) ?? 0.0).toDouble()), Unit.KM)) <=
                1.0
            ? 10
            : (haversineDistance.haversine(Location(current.latitude.toDouble(), current.longitude.toDouble()), Location(((explode['latitude'] as num?) ?? 0.0).toDouble(), ((explode['longitude'] as num?) ?? 0.0).toDouble()), Unit.KM)) > 1.0 &&
                    (haversineDistance.haversine(Location(current.latitude.toDouble(), current.longitude.toDouble()), Location(((explode['latitude'] as num?) ?? 0.0).toDouble(), ((explode['longitude'] as num?) ?? 0.0).toDouble()), Unit.KM)) <= 3.0
                ? 30
                : (haversineDistance.haversine(Location(current.latitude.toDouble(), current.longitude.toDouble()), Location(((explode['latitude'] as num?) ?? 0.0).toDouble(), ((explode['longitude'] as num?) ?? 0.0).toDouble()), Unit.KM)) > 3.0 && (haversineDistance.haversine(Location(current.latitude.toDouble(), current.longitude.toDouble()), Location(((explode['latitude'] as num?) ?? 0.0).toDouble(), ((explode['longitude'] as num?) ?? 0.0).toDouble()), Unit.KM)) <= 5.0
                    ? 50
                    : (haversineDistance.haversine(Location(current.latitude.toDouble(), current.longitude.toDouble()), Location(((explode['latitude'] as num?) ?? 0.0).toDouble(), ((explode['longitude'] as num?) ?? 0.0).toDouble()), Unit.KM)) > 5.0
                        ? 70
                        : 0,

        // nilai bobot harga
        cPrice: ((explode['for_two'] as num? ?? 0.0).toDouble()) <= 25000
            ? 10
            : ((explode['for_two'] as num? ?? 0.0).toDouble()) > 25000 && ((explode['for_two'] as num? ?? 0.0).toDouble()) <= 50000
                ? 30
                : ((explode['for_two'] as num? ?? 0.0).toDouble()) > 50000 && ((explode['for_two'] as num? ?? 0.0).toDouble()) <= 75000
                    ? 50
                    : ((explode['for_two'] as num? ?? 0.0).toDouble()) > 75000
                        ? 70
                        : 0,

        // nilai bobot rating
        cRate: ((explode['average'] as num? ?? 0.0).toDouble()) == 5.0
            ? 70
            : (explode['average'] as num? ?? 0.0).toDouble() < 5.0 && (explode['average'] as num? ?? 0.0).toDouble() == 4.0
                ? 50
                : (explode['average'] as num? ?? 0.0).toDouble() < 4.0 && (explode['average'] as num? ?? 0.0).toDouble() == 3.0
                    ? 30
                    : (explode['average'] as num? ?? 0.0).toDouble() < 3.0
                        ? 10
                        : 0);
  }

  // Map<String, dynamic> toload() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['name'] = this.name;
  //   data['title'] = this.title;
  //   data['url'] = this.url;
  //   data['tags'] = this.tags;
  //   data['address'] = this.address;
  //   data['locality'] = this.locality;
  //   data['city'] = this.city;
  //   data['city_id'] = this.cityId;
  //   data['latitude'] = this.latitude;
  //   data['longitude'] = this.longitude;
  //   data['country_id'] = this.countryId;
  //   data['map_url'] = this.mapUrl;
  //   data['locality_verbose'] = this.localityVerbose;
  //   data['zipcode'] = this.zipcode;
  //   data['type'] = this.type;
  //   data['phones'] = this.phones;
  //   data['style_id'] = this.styleId;
  //   data['style'] = this.style;
  //   data['count'] = this.count;
  //   data['average'] = this.average;
  //   data['reload'] = this.reload;
  //   data['votes'] = this.votes;
  //   data['wishlisters'] = this.wishlisters;
  //   data['timing'] = this.timing;
  //   data['status'] = this.status;
  //   data['ac'] = this.ac;
  //   data['live_music'] = this.liveMusic;
  //   data['wifi'] = this.wifi;
  //   data['fullbar'] = this.fullbar;
  //   data['smoking_area'] = this.smokingArea;
  //   data['reloadaway'] = this.reloadaway;
  //   data['bar'] = this.bar;
  //   data['delivery'] = this.delivery;
  //   data['img_prim_url'] = this.imgPrimUrl;
  //   data['img_thumb_prim'] = this.imgThumbPrim;
  //   data['img_sec_url'] = this.imgSecUrl;
  //   data['img_sec_thumb'] = this.imgSecThumb;
  //   data['likes'] = this.likes;
  //   data['comments'] = this.comments;
  //   data['width'] = this.width;
  //   data['height'] = this.height;
  //   data['payment'] = this.payment;
  //   data['for_two'] = this.forTwo;
  //   data['beer'] = this.beer;
  //   data['currency'] = this.currency;
  //   data['vat'] = this.vat;
  //   data['twitter'] = this.twitter;
  //   data['menu_type'] = this.menuType;
  //   data['img_menu'] = this.imgMenu;
  //   data['img_menu_thumb'] = this.imgMenuThumb;
  //   return data;
  // }
}
