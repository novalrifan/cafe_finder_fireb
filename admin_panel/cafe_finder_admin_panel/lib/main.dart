import 'package:cafe_finder_admin_panel/blocs/user_bloc/user_bloc.dart';
import 'package:cafe_finder_admin_panel/config/approute.dart';
import 'package:cafe_finder_admin_panel/repositories/customer/customer_repo.dart';
import 'package:cafe_finder_admin_panel/repositories/places/places_repo.dart';
import 'package:cafe_finder_admin_panel/screen/customer/customer_screen.dart';
import 'package:cafe_finder_admin_panel/screen/dashboard.dart';
import 'package:cafe_finder_admin_panel/screen/login/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/places_bloc/coffeeshops_bloc.dart';
import 'config/theme.dart';

import 'firebase_options.dart';
import 'screen/places/menu_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
            create: (context) => PlaceRepo(),
          ),
          RepositoryProvider(create: (context) => CustomerRepo())
        ],
        child: MultiBlocProvider(
            providers: [
              BlocProvider(
                  create: (context) =>
                      CoffeeshopsBloc(coffeeRepo: context.read<PlaceRepo>())),
              BlocProvider(
                  create: (context) =>
                      UserBloc(customerRepo: context.read<CustomerRepo>())),
            ],
            child: MaterialApp(
              title: 'Admin Panel',
              theme: theme(),
              onGenerateRoute: AppRouter.onGenerateRoute,
              initialRoute: DashBoard.routeName,
              routes: {
                '/dash': (context) => const DashBoard(),
                '--menu': (context) => const MenuScreen(),
                '--customer': (context) => const CScreen(),
              },
            )));
  }
}
