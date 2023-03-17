// import 'package:cafe_finder_fireb/src/features/core/models/coffeestore_model.dart';
// import 'package:flutter/material.dart';

// class FeaturesDetail extends StatelessWidget {
//   final Coffeeshops coffeeshops;
//   const FeaturesDetail({Key? key, required this.coffeeshops}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Container(
//         decoration: BoxDecoration(
//             borderRadius: const BorderRadius.all(Radius.circular(16.0)),
//             boxShadow: <BoxShadow>[
//               BoxShadow(
//                   color: Colors.black.withOpacity(0.18),
//                   offset: const Offset(4, 4),
//                   blurRadius: 16)
//             ]),
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(top: 8, left: 6, bottom: 6),
//               child: Row(
//                 children: [
//                   Text(
//                     'Features',
//                     style: Theme.of(context)
//                         .textTheme
//                         .headline5!
//                         .copyWith(fontWeight: FontWeight.bold, fontSize: 16.0),
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 8, right: 16, bottom: 8),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Icon(
//                     Icons.featured_play_list,
//                     size: 16,
//                   ),
//                   const SizedBox(
//                     width: 5,
//                   ),
//                   Text(
//                     'Services : ',
//                     style: Theme.of(context)
//                         .textTheme
//                         .bodyText2!
//                         .copyWith(fontWeight: FontWeight.bold),
//                   )
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 18, right: 16),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text('Wifi: ', style: Theme.of(context).textTheme.bodyText2),
//                   Icon(
//                     // ignore: unnecessary_null_in_if_null_operators
//                     coffeeshops.wifi != null
//                         ? (Icons.done)
//                         : Icons.close_rounded,
//                     color: coffeeshops.wifi != null ? Colors.green : Colors.red,
//                     size: 20,
//                   ),
//                   const SizedBox(
//                     width: 5,
//                   ),
//                   Text('Ac: ', style: Theme.of(context).textTheme.bodyText2),
//                   Icon(
//                     // ignore: unnecessary_null_in_if_null_operators
//                     coffeeshops.ac != null ? (Icons.done) : Icons.close_rounded,
//                     color: coffeeshops.ac != null ? Colors.green : Colors.red,
//                     size: 20,
//                   ),
//                   const SizedBox(
//                     width: 5,
//                   ),
//                   Text('Live Music: ',
//                       style: Theme.of(context).textTheme.bodyText2),
//                   Icon(
//                     // ignore: unnecessary_null_in_if_null_operators
//                     coffeeshops.liveMusic != null
//                         ? (Icons.done)
//                         : Icons.close_rounded,
//                     color: coffeeshops.liveMusic != null
//                         ? Colors.green
//                         : Colors.red,
//                     size: 20,
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 8, right: 16, bottom: 8),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Icon(
//                     Icons.featured_play_list,
//                     size: 16,
//                   ),
//                   const SizedBox(
//                     width: 5,
//                   ),
//                   Text(
//                     'Serves : ',
//                     style: Theme.of(context)
//                         .textTheme
//                         .bodyText2!
//                         .copyWith(fontWeight: FontWeight.bold),
//                   )
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 18, right: 16, bottom: 10),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text('Serve Beer: ',
//                       style: Theme.of(context).textTheme.bodyText2),
//                   Icon(
//                     // ignore: unnecessary_null_in_if_null_operators
//                     coffeeshops.beer != 0 ? (Icons.done) : Icons.close_rounded,
//                     color: coffeeshops.beer != 0 ? Colors.green : Colors.red,
//                     size: 20,
//                   ),
//                   const SizedBox(
//                     width: 5,
//                   ),
//                   Text('Signature Menus: ',
//                       style: Theme.of(context).textTheme.bodyText2),
//                   Icon(
//                     // ignore: unnecessary_null_in_if_null_operators
//                     coffeeshops.smokingArea != 0
//                         ? (Icons.done)
//                         : Icons.close_rounded,
//                     // ignore: unrelated_type_equality_checks
//                     color: coffeeshops.smokingArea != 0
//                         ? Colors.green
//                         : Colors.red,
//                     size: 20,
//                   ),
//                   const SizedBox(
//                     width: 5,
//                   ),
//                   Text('Manual Brew: ',
//                       style: Theme.of(context).textTheme.bodyText2),
//                   Icon(
//                     // ignore: unnecessary_null_in_if_null_operators
//                     coffeeshops.tags!.contains('Coffee')
//                         ? (Icons.done)
//                         : Icons.close_rounded,
//                     color: coffeeshops.tags!.contains('Coffee')
//                         ? Colors.green
//                         : Colors.red,
//                     size: 20,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
