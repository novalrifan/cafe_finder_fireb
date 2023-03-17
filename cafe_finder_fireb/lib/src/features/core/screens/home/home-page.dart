// ignore_for_file: file_names, avoid_print

import 'package:cafe_finder_fireb/src/features/core/repository/auth_/authuser.dart';
import 'package:cafe_finder_fireb/src/features/core/screens/home/recommendation/recommend_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:geocoding/geocoding.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'package:cafe_finder_fireb/src/features/core/screens/home/list-page/place_list.dart';
import 'package:cafe_finder_fireb/src/features/core/screens/home/profile_page/profile.dart';
import 'package:cafe_finder_fireb/src/features/core/screens/home/search-page/search_page_screen.dart';
import 'package:cafe_finder_fireb/src/features/core/screens/home/widgets/home_appbar_widget.dart';

import '../../../../constants/constants_export.dart';
import '../../bloc/blocs.dart';
import 'widgets/extended_map.dart';
import 'widgets/snack.dart';

// ignore: must_be_immutable
class Dashboard extends StatefulWidget {
  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const Dashboard(),
      settings: const RouteSettings(name: routeName),
    );
  }

  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Placemark placemark = getAddressFromSharedPrefs();
  final List<String> _title = ['Main', 'Mabac', 'Explore', 'Maps', 'Profile'];
  final List<Widget> _pages = [
    const PlacesList(),
    const WithMethod(),
    const SearchPage(),
    const Mapsss(),
    const ProfilePage(),
  ];

  int _index = 0;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;
    final User? user = Auth().currentUser;
    return BlocListener<AuthuserBloc, AuthuserState>(
      listenWhen: (previous, current) =>
          previous.isLoading != current.successful,
      listener: (context, state) {
        if (state.successful) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: CustomSnack(
                color: greyShade,
                text: 'Good',
                color2: tEals,
                notify: 'You\'re Signed in as : ${user!.email}',
              ),
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: CustomSnack(
                color: Color(0xFFC72C41),
                text: 'ooops',
                color2: Color(0xFF801336),
                notify: 'User Not Fouund',
              ),
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
          );
        }
      },
      child: Scaffold(
        appBar: DashboardAppbar(
          appTitle: _title[_index],
        ),
        drawer: Container(),
        // Drawer(
        //   backgroundColor: isDarkMode ? tSecondary : cardbg,
        //   width: 150,
        //   child: SingleChildScrollView(
        //     child: Column(children: <Widget>[
        //       buildHeader(context),
        //       buildMenuItems(context),
        //     ]),
        //   ),
        // ),
        body: _pages[_index],
        bottomNavigationBar: Container(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
            child: GNav(
                tabBackgroundColor:
                    isDarkMode ? Colors.black54 : Colors.white38,
                activeColor: isDarkMode ? white : black,
                onTabChange: (selectIndex) {
                  setState(() {
                    _index = selectIndex;
                  });
                },
                padding: const EdgeInsets.all(
                  8,
                ),
                gap: 10,
                selectedIndex: _index,
                tabs: [
                  GButton(
                    icon: Icons.dashboard,
                    text: 'Main',
                    textColor: isDarkMode ? white : black,
                  ),
                  GButton(
                    icon: Icons.recommend,
                    text: 'Recommendation',
                    textColor: isDarkMode ? white : black,
                  ),
                  GButton(
                    icon: Icons.search,
                    text: 'Explore',
                    textColor: isDarkMode ? white : black,
                  ),
                  GButton(
                    icon: Icons.map,
                    text: 'Maps',
                    textColor: isDarkMode ? white : black,
                  ),
                  GButton(
                    icon: Icons.person,
                    text: 'Profile',
                    textColor: isDarkMode ? white : black,
                  ),
                ]),
          ),
        ),
      ),
    );
  }

  // Widget buildHeader(BuildContext context) => Padding(
  //       padding: const EdgeInsets.only(
  //         top: 80,
  //       ),
  //       child: SizedBox(
  //         width: 100,
  //         height: 100,
  //         child: Stack(
  //           children: [
  //             Container(
  //               decoration: BoxDecoration(
  //                   borderRadius: BorderRadius.circular(60),
  //                   color: Colors.white54),
  //               child: const Center(
  //                 child: Expanded(
  //                   child: Icon(
  //                     Icons.account_circle_sharp,
  //                     size: 100,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     );
  // Widget buildMenuItems(BuildContext context) => Container(
  //     // child: Text(
  //     //       '${placemark.subAdministrativeArea}',
  //     //       style: Theme.of(context).textTheme.headline4,
  //     //     ),
  //     );
}
