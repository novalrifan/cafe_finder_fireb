import 'package:cafe_finder_fireb/src/features/core/screens/home/profile_page/profile.dart';
import 'package:cafe_finder_fireb/src/features/core/screens/welcome/welcome_screen.dart';
import 'package:cafe_finder_fireb/src/routes/controllers/screen_controller.dart';
import 'package:cafe_finder_fireb/src/routes/controllers/location_controller.dart';
import 'package:cafe_finder_fireb/src/features/core/screens/auth/login/login_screen.dart';

import 'package:cafe_finder_fireb/src/features/core/screens/home/detail_page/detail_new.dart';

import 'package:cafe_finder_fireb/src/features/core/screens/home/home-page.dart';
import 'package:cafe_finder_fireb/src/features/core/screens/auth/login/login_view.dart';
import 'package:cafe_finder_fireb/src/features/core/screens/auth/signup/email_view.dart';
import 'package:cafe_finder_fireb/src/features/core/screens/auth/signup/password_view.dart';
import 'package:flutter/material.dart';

import '../features/core/models/coffeestore_model.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Dashboard.routeName:
        return Dashboard.route();
      case ScreenController.routeName:
        return ScreenController.route();
      case LoginView.routeName:
        return LoginView.route();
      case EmailView.routeName:
        return EmailView.route();
      case PasswordView.routeName:
        return PasswordView.route();
      case LoginScreen.routeName:
        return LoginScreen.route();
      case ProfilePage.routeName:
        return ProfilePage.route();
      case WelcomeScreen.routeName:
        return WelcomeScreen.route();

      case DetailP.routeName:
        return DetailP.route(coffeeshops: settings.arguments as Coffeeshops);
      case Splash.routeName:
        return Splash.route();

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
