// // ignore_for_file: public_member_api_docs, sort_constructors_first
// // ignore_for_file: unnecessary_new

// import 'package:cafe_finder_fireb/src/constants/shared/shared_pref.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:haversine_distance/haversine_distance.dart';
// import 'package:mapbox_gl/mapbox_gl.dart';

// import '../../../models/coffeestore_model.dart';

// // ignore: must_be_immutable
// class DashboardCardWidget extends StatelessWidget {
//   LatLng latLng = getLatLngFromSharedPrefs();
//   final haversineDistance = HaversineDistance();
//   final Coffeeshops coffeeshops;

//   DashboardCardWidget({
//     Key? key,
//     required this.coffeeshops,
//   }) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     var currentlatLng = Location(latLng.latitude, latLng.longitude);
//     var placelatLng = Location(
//         coffeeshops.latitude!.toDouble(), coffeeshops.longitude!.toDouble());
//     var distances =
//         '${haversineDistance.haversine(currentlatLng, placelatLng, Unit.KM).toStringAsFixed(1)} km away';
//     return InkWell(
//       onTap: () {
//         Navigator.pushNamed(
//           context,
//           '/coffeeshop-details',
//           arguments: coffeeshops,
//         );
//       },
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Stack(
//               children: [
//                 SizedBox(
//                   width: MediaQuery.of(context).size.width - 70,
//                   height: 200,
//                   child: Container(
//                     decoration: BoxDecoration(
//                       border: const Border(
//                         left: BorderSide(
//                           width: 20,
//                         ),
//                       ),
//                       borderRadius: BorderRadius.circular(5.0),
//                       image: DecorationImage(
//                         image: NetworkImage(
//                           coffeeshops.imgSecUrl.toString(),
//                         ),
//                         fit: BoxFit.contain,
//                         filterQuality: FilterQuality.high,
//                       ),
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   right: 12,
//                   top: 3,
//                   child: Container(
//                     width: 80,
//                     height: 30,
//                     decoration: new BoxDecoration(
//                       borderRadius: new BorderRadius.circular(8.0),
//                     ),
//                     child: Align(
//                       alignment: Alignment.topRight,
//                       child: RatingBarIndicator(
//                         rating: coffeeshops.average!.toDouble(),
//                         itemCount: 5,
//                         itemSize: 12.0,
//                         itemBuilder: (context, _) => const Icon(
//                           Icons.star,
//                           color: Colors.amber,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     coffeeshops.name.toString(),
//                     style: Theme.of(context).textTheme.headline4,
//                   ),
//                   const SizedBox(
//                     height: 5,
//                   ),
//                   Text(
//                     coffeeshops.tags.toString(),
//                     style: Theme.of(context)
//                         .textTheme
//                         .bodyText2!
//                         .copyWith(fontStyle: FontStyle.italic),
//                   ),
//                   // CoffeeshopTags(coffeeshops: coffeeshop),
//                   const SizedBox(
//                     height: 5,
//                   ),
//                   Text(
//                     distances,
//                     style: Theme.of(context).textTheme.bodyText2,
//                   ),
//                   // ignore: avoid_print

//                   const SizedBox(
//                     height: 5,
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     TextButton.icon(
//                       onPressed: () {
//                         Navigator.pushNamed(
//                           context,
//                           '/this-map',
//                           arguments: coffeeshops,
//                         );
//                       },
//                       icon: const Icon(
//                         Icons.data_exploration_sharp,
//                         size: 25,
//                       ),
//                       label: const Text(''),
//                     ),
//                   ]),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// //   @override
// //   Widget build(BuildContext context) {
// //     return SizedBox(
// //       width: double.infinity,
// //       height: 260,
// //       child: Stack(
// //         children: [
// //           Card(
// //             clipBehavior: Clip.antiAliasWithSaveLayer,
// //             shape:
// //                 RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
// //             elevation: 10,
// //             child: Column(
// //               children: [
// //                 SizedBox(
// //                     width: double.infinity,
// //                     height: 140,
// //                     child: Image.asset(coffeeshops.photo.toString(),
// //                         fit: BoxFit.cover))
// //               ],
// //             ),
// //           ),
// //           Positioned(
// //             bottom: 0,
// //             left: 10,
// //             child: SizedBox(
// //               height: 100,
// //               child: Padding(
// //                 padding: const EdgeInsets.only(left: 10, right: 10),
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     SizedBox(
// //                       height: 35,
// //                       child: Text(coffeeshops.name.toString(),
// //                           style: Theme.of(context).textTheme.headline5),
// //                     ),
// //                     SizedBox(
// //                       height: 20,
// //                       child: Row(
// //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                         children: [
// //                           Column(
// //                             children: [
// //                               Text(
// //                                 coffeeshops.cuisines.toString(),
// //                                 style: Theme.of(context)
// //                                     .textTheme
// //                                     .bodyText2
// //                                     ?.apply(color: tSecondary),
// //                               ),
// //                             ],
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                     const SizedBox(
// //                       height: 7,
// //                     ),
// //                     Row(
// //                       crossAxisAlignment: CrossAxisAlignment.start,
// //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                       children: [
// //                         const Icon(Icons.star, color: Colors.amber),
// //                         const SizedBox(
// //                           width: 5,
// //                         ),
// //                         Text("This Rating",
// //                             style: Theme.of(context).textTheme.bodyText2),
// //                         const SizedBox(
// //                           width: 10,
// //                         ),
// //                         const Icon(Icons.access_time, color: Colors.grey),
// //                         const SizedBox(
// //                           width: 5,
// //                         ),
// //                         Text(coffeeshops.timing.toString(),
// //                             style: Theme.of(context).textTheme.bodyText2),
// //                         const SizedBox(
// //                           width: 10,
// //                         ),
// //                         Text("This Price",
// //                             style: Theme.of(context).textTheme.bodyText2),
// //                         const SizedBox(
// //                           width: 15,
// //                         ),
// //                         Text("this Distance",
// //                             style: Theme.of(context).textTheme.bodyText2),
// //                       ],
// //                     )
// //                   ],
// //                 ),
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
