import 'package:cafe_finder_fireb/src/common_widgets/form/form_header_widget.dart';
import 'package:cafe_finder_fireb/src/constants/color.dart';
import 'package:cafe_finder_fireb/src/constants/images_source.dart';
import 'package:cafe_finder_fireb/src/constants/sizes.dart';
import 'package:cafe_finder_fireb/src/features/core/screens/auth/login/login_footer_widget.dart';
import 'package:cafe_finder_fireb/src/features/core/screens/auth/login/login_form_widget.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'login';
  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const LoginScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: isDarkMode ? tSecondary : cardbg.withOpacity(0.4),
          title: Text(
            'Login',
            style: Theme.of(context).textTheme.headline4,
          ),
          elevation: 0,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  FormHeaderWidget(
                    image: tCatImage1,
                    title: '',
                    subTitle: '',
                  ),
                  LoginForm(),
                  LoginFooterWidget(),
                ]),
          ),
        ),
      ),
    );
  }
}
