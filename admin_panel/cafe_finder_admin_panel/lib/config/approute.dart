import 'package:cafe_finder_admin_panel/models/coffeeshop_model.dart';
import 'package:cafe_finder_admin_panel/screen/dashboard.dart';
import 'package:cafe_finder_admin_panel/screen/places/menu_screen.dart';
import 'package:cafe_finder_admin_panel/screen/setting/settings_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case DashBoard.routeName:
        return DashBoard.route();
      case MenuScreen.routeName:
        return MenuScreen.route();

        // ignore: dead_code
        break;
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('error')),
      ),
      settings: const RouteSettings(name: '/error'),
    );
  }
}
