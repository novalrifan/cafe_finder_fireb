// ignore_for_file: public_member_api_docs, sort_constructors_first, unused_import

import 'dart:io';

import 'package:cafe_finder_fireb/src/common_widgets/animation/loading_widget.dart';
import 'package:cafe_finder_fireb/src/constants/constants_export.dart';
import 'package:cafe_finder_fireb/src/features/core/repository/auth_/authuser.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatelessWidget {
  static const String routeName = 'profile';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const ProfilePage(),
      settings: const RouteSettings(name: routeName),
    );
  }

  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Placemark placemark = getAddressFromSharedPrefs();
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users')
            .where('email', isEqualTo: Auth().currentUser!.email)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.docs.length,
                itemBuilder: ((context, index) {
                  var explode = snapshot.data!.docs[index];
                  return SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: double.infinity,
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      padding: const EdgeInsets.all(10),
                      children: [
                        // COLUMN THAT WILL CONTAIN THE PROFILE
                        Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(width: 4, color: white),
                                  ),
                                  child: ClipOval(
                                    child: Material(
                                      color: Colors.transparent,
                                      child: Ink.image(
                                        image: NetworkImage(
                                            explode['profilepic'] ?? noImage),
                                        fit: BoxFit.cover,
                                        width: 128,
                                        height: 128,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 4,
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border:
                                            Border.all(width: 4, color: white),
                                        color: tEals),
                                    child: const Icon(
                                      Icons.edit,
                                      color: white,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            // CircleAvatar(
                            //   radius: 50,
                            //   backgroundColor: explode['profilepic'] == null
                            //       ? white
                            //       : Colors.transparent,
                            //   foregroundImage: NetworkImage(
                            //     explode['profilepic'] ?? noImage,
                            //   ),
                            //   // backgroundImage: NetworkImage(
                            //   //   explode['profilepic'],
                            //   // ),
                            // ),

                            const SizedBox(height: 10),
                            Text(
                              explode['name'] ?? '',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(explode['email'] ?? '')
                          ],
                        ),
                        const SizedBox(height: 25),
                        // Row(
                        //   children: const [
                        //     Padding(
                        //       padding: EdgeInsets.only(right: 5),
                        //       child: Text(
                        //         "Complete your profile",
                        //         style: TextStyle(
                        //           fontWeight: FontWeight.bold,
                        //         ),
                        //       ),
                        //     ),
                        //     Text(
                        //       "(1/5)",
                        //       style: TextStyle(
                        //         color: Colors.blue,
                        //       ),
                        //     )
                        //   ],
                        // ),
                        // const SizedBox(height: 10),
                        // Row(
                        //   children: List.generate(5, (index) {
                        //     return Expanded(
                        //       child: Container(
                        //         height: 7,
                        //         margin:
                        //             EdgeInsets.only(right: index == 4 ? 0 : 6),
                        //         decoration: BoxDecoration(
                        //           borderRadius: BorderRadius.circular(10),
                        //           color:
                        //               index == 0 ? Colors.blue : Colors.black12,
                        //         ),
                        //       ),
                        //     );
                        //   }),
                        // ),
                        // const SizedBox(height: 10),
                        // SizedBox(
                        //   height: 180,
                        //   child: ListView.separated(
                        //     physics: const BouncingScrollPhysics(),
                        //     scrollDirection: Axis.horizontal,
                        //     itemBuilder: (context, index) {
                        //       final card = profileCompletionCards[index];
                        //       return SizedBox(
                        //         width: 160,
                        //         child: Card(
                        //           shadowColor: Colors.black12,
                        //           child: Padding(
                        //             padding: const EdgeInsets.all(15),
                        //             child: Column(
                        //               children: [
                        //                 Icon(
                        //                   card.icon,
                        //                   size: 30,
                        //                 ),
                        //                 const SizedBox(height: 10),
                        //                 Text(
                        //                   card.title,
                        //                   textAlign: TextAlign.center,
                        //                 ),
                        //                 const Spacer(),
                        //                 ElevatedButton(
                        //                   onPressed: () {},
                        //                   style: ElevatedButton.styleFrom(
                        //                     elevation: 0,
                        //                     shape: RoundedRectangleBorder(
                        //                         borderRadius:
                        //                             BorderRadius.circular(10)),
                        //                   ),
                        //                   child: Text(card.buttonText),
                        //                 )
                        //               ],
                        //             ),
                        //           ),
                        //         ),
                        //       );
                        //     },
                        //     separatorBuilder: (context, index) => const Padding(
                        //         padding: EdgeInsets.only(right: 5)),
                        //     itemCount: profileCompletionCards.length,
                        //   ),
                        // ),
                        const SizedBox(height: 25),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 48),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Social Media',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                explode['social_media'],
                                style:
                                    const TextStyle(fontSize: 16, height: 1.4),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 25),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 48),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Pekerjaaan',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                explode['jobs'],
                                style:
                                    const TextStyle(fontSize: 16, height: 1.4),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 25),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 48),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Location',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                '${placemark.locality}, ${placemark.subAdministrativeArea}',
                                style:
                                    const TextStyle(fontSize: 16, height: 1.4),
                              ),
                            ],
                          ),
                        ),
                        // ...List.generate(
                        //   customListTiles.length,
                        //   (index) {
                        //     final tile = customListTiles[index];
                        //     return Padding(
                        //       padding: const EdgeInsets.only(bottom: 5),
                        //       child: Card(
                        //         elevation: 4,
                        //         shadowColor: Colors.black12,
                        //         child: ListTile(
                        //           leading: Icon(tile.icon),
                        //           title: Text(tile.title),
                        //           trailing: const Icon(Icons.chevron_right),
                        //         ),
                        //       ),
                        //     );
                        //   },
                        // )
                      ],
                    ),
                  );
                }));
          } else {
            return const Center(
              child: LoadingWidget(),
            );
          }
        });
    // bottomNavigationBar: BottomNavigationBar(
    //   currentIndex: 3,
    //   type: BottomNavigationBarType.fixed,
    //   items: const [
    //     BottomNavigationBarItem(
    //       icon: Icon(CupertinoIcons.home),
    //       label: "Home",
    //     ),
    //     BottomNavigationBarItem(
    //       icon: Icon(CupertinoIcons.chat_bubble_2),
    //       label: "Messages",
    //     ),
    //     BottomNavigationBarItem(
    //       icon: Icon(CupertinoIcons.book),
    //       label: "Discover",
    //     ),
    //     BottomNavigationBarItem(
    //       icon: Icon(CupertinoIcons.person),
    //       label: "Profile",
    //     ),
    //   ],
    // ),
  }

  Widget buildEditIcon(Color color) => buildCircle(
        color: Colors.white,
        all: 3,
        child: buildCircle(
          color: color,
          all: 8,
          child: const Icon(
            Icons.edit,
            color: Colors.white,
            size: 20,
          ),
        ),
      );

  Widget buildCircle({
    required Widget child,
    required double all,
    required Color color,
  }) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );
}

class ProfileCompletionCard {
  final String title;
  final String buttonText;
  final IconData icon;
  ProfileCompletionCard({
    required this.title,
    required this.buttonText,
    required this.icon,
  });
}

List<ProfileCompletionCard> profileCompletionCards = [
  ProfileCompletionCard(
    title: "Set Your Profile Details",
    icon: CupertinoIcons.person_circle,
    buttonText: "Continue",
  ),
  ProfileCompletionCard(
    title: "Upload your resume",
    icon: CupertinoIcons.doc,
    buttonText: "Upload",
  ),
  ProfileCompletionCard(
    title: "Add your skills",
    icon: CupertinoIcons.square_list,
    buttonText: "Add",
  ),
];

class CustomListTile {
  final IconData icon;
  final String title;
  CustomListTile({
    required this.icon,
    required this.title,
  });
}

List<CustomListTile> customListTiles = [
  CustomListTile(
    icon: Icons.work,
    title: "Pekerjaan",
  ),
  CustomListTile(
    icon: Icons.location_on_outlined,
    title: "Lokasi",
  ),
  CustomListTile(
    title: "Notifications",
    icon: CupertinoIcons.bell,
  ),
  // CustomListTile(
  //   title: "Logout",
  //   icon: CupertinoIcons.arrow_right_arrow_left,
  // ),
];
