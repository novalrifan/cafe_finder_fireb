// ignore_for_file: unused_import

import 'package:cafe_finder_fireb/firebase_options.dart';

import 'package:cafe_finder_fireb/src/features/core/bloc/blocs.dart';

import 'package:cafe_finder_fireb/src/routes/controllers/location_controller.dart';
import 'package:cafe_finder_fireb/src/routes/controllers/screen_controller.dart';

import 'package:cafe_finder_fireb/src/features/core/screens/home/home-page.dart';
import 'package:cafe_finder_fireb/src/features/core/screens/auth/signup/email_view.dart';
import 'package:cafe_finder_fireb/src/routes/approuter.dart';
import 'package:cafe_finder_fireb/src/utils/theme/this_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'src/features/core/repository/export_repo.dart';

late SharedPreferences sharedPreferences;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  await dotenv.load(fileName: "assets/config/.env");
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => Auth(),
        ),
        RepositoryProvider(
          create: (context) => CoffeeRepo(),
        ),
        RepositoryProvider(
          create: (context) => CoffeeRepo2(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthuserBloc(),
          ),
          BlocProvider(
            create: (context) => CoffeeshopsBloc(
              coffeeRepo: context.read<CoffeeRepo>(),
            ),
          ),
          BlocProvider(
            create: (context) => ByRateBloc(
              coffeeRepo: context.read<CoffeeRepo2>(),
            ),
          ),
          BlocProvider(
            create: (context) => ByDistanceBloc(
              coffeeRepo: context.read<CoffeeRepo>(),
            ),
          ),
          BlocProvider(
            create: (context) => ByPriceBloc(
              coffeeRepo: context.read<CoffeeRepo>(),
            ),
          ),
          BlocProvider(
            create: (context) => MabacMethodBloc(
              coffeeRepo: context.read<CoffeeRepo>(),
            ),
          ),
        ],
        child: MaterialApp(
          theme: TAppTheme.lightTheme,
          darkTheme: TAppTheme.darkTheme,
          themeMode: ThemeMode.system,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: ScreenController.routeName,
        ),
      ),
    );
  }
}
