// import 'package:cafe_finder_fireb/src/constants/images.dart';
// import 'package:cafe_finder_fireb/src/features/core/models/coffeestore_model.dart';
// import 'package:flutter/material.dart';

// import '../detail_page.dart';

// class TagsPlaces extends StatelessWidget {
//   static const String routeName = '/coffeeshop-details';
//   static Route route({required Coffeeshops coffeeshops}) {
//     return MaterialPageRoute(
//         builder: (_) => DetailPage(coffeeshops: coffeeshops));
//   }

//   final Coffeeshops coffeeshops;
//   const TagsPlaces({Key? key, required this.coffeeshops}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 2),
//       child: Card(
//         child: Container(
//           decoration: BoxDecoration(
//               borderRadius: const BorderRadius.all(Radius.circular(16.0)),
//               boxShadow: <BoxShadow>[
//                 BoxShadow(
//                     color: Colors.black.withOpacity(0.18),
//                     offset: const Offset(4, 4),
//                     blurRadius: 16)
//               ]),
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(top: 8, left: 6, bottom: 8),
//                 child: Row(
//                   children: [
//                     Text(
//                       'Info',
//                       style: Theme.of(context)
//                           .textTheme
//                           .headline4!
//                           .copyWith(fontWeight: FontWeight.bold),
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 4, bottom: 16, right: 16),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Row(
//                       // ignore: prefer_const_literals_to_create_immutables
//                       children: [
//                         const Image(
//                           image: AssetImage(tCatImage2),
//                           height: 25,
//                           width: 25,
//                         ),
//                         const SizedBox(
//                           width: 5,
//                         ),
//                         Text(
//                           coffeeshops.tags.toString(),
//                           style: Theme.of(context)
//                               .textTheme
//                               .bodyText1!
//                               .copyWith(
//                                   fontStyle: FontStyle.italic,
//                                   fontWeight: FontWeight.normal,
//                                   fontSize: 12),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 4),
//                 child: Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Flexible(
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             const Icon(
//                               Icons.watch_later,
//                               size: 25,
//                             ),
//                             const SizedBox(
//                               width: 5,
//                             ),
//                             Text(
//                               coffeeshops.timing!,
//                               textAlign: TextAlign.left,
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .bodyText2!
//                                   .copyWith(fontSize: 11),
//                             ),
//                           ],
//                         ),
//                       )
//                     ]),
//               ),

//               // Padding(
//               //   padding: const EdgeInsets.only(left: 4, right: 8),
//               //   child: Row(
//               //     mainAxisAlignment: MainAxisAlignment.start,
//               //     children: [
//               //       const Icon(
//               //         Icons.watch_later,
//               //         size: 25,
//               //       ),
//               //       const SizedBox(
//               //         width: 8,
//               //       ),
//               //       Text(coffeeshops.timing.toString(),
//               //           style: Theme.of(context)
//               //               .textTheme
//               //               .bodyText1!
//               //               .copyWith(fontSize: 12)),
//               //     ],
//               //   ),
//               // ),
//               Padding(
//                 padding: const EdgeInsets.only(
//                   left: 2,
//                   bottom: 20,
//                 ),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Image(
//                             image: AssetImage(
//                               'assets/icons/coffee-shop.png',
//                             ),
//                             height: 25,
//                             width: 25,
//                           ),
//                           const SizedBox(
//                             width: 5,
//                           ),
//                           Text(
//                             coffeeshops.localityVerbose.toString(),
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .bodyText1!
//                                 .copyWith(
//                                     fontStyle: FontStyle.normal, fontSize: 12),
//                           ),
//                           TextButton.icon(
//                             onPressed: () {
//                               Navigator.pushNamed(
//                                 context,
//                                 '/this-map',
//                                 arguments: coffeeshops,
//                               );
//                             },
//                             icon: const Icon(
//                               Icons.data_exploration_sharp,
//                               size: 25,
//                             ),
//                             label: const Text(''),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
