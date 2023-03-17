import 'package:flutter/material.dart';

import '../widget/custom_appbar.dart';
import '../widget/custom_drawer.dart';

class DashBoard extends StatelessWidget {
  static const String routeName = '/dash';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const DashBoard(),
      settings: const RouteSettings(name: routeName),
    );
  }

  const DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          titl: 'Dashboard',
        ),
        drawer: const CustomDrawer(),
        body: Container());
  }
}
