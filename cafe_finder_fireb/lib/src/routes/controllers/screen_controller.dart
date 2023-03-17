import 'package:cafe_finder_fireb/src/features/core/bloc/appuser/authuser_bloc.dart';
import 'package:cafe_finder_fireb/src/routes/controllers/location_controller.dart';
import 'package:cafe_finder_fireb/src/features/core/repository/auth_/authuser.dart';
import 'package:cafe_finder_fireb/src/features/core/screens/auth/login/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenController extends StatelessWidget {
  static const String routeName = 'controller';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const ScreenController(),
      settings: const RouteSettings(name: routeName),
    );
  }

  const ScreenController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Thisbuilder();
  }
}

class Thisbuilder extends StatelessWidget {
  const Thisbuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        return BlocBuilder<AuthuserBloc, AuthuserState>(
          builder: (context, state) {
            if (state is AuthUserStateLoggedIn) {
              return const Splash();
            }
            if (state is AuthUserStateLoggedOut) {
              return const LoginScreen();
            } else {
              return Container();
            }
          },
        );
      },
    );
  }
}
