import 'package:cafe_finder_fireb/src/constants/color.dart';
import 'package:cafe_finder_fireb/src/constants/images_source.dart';
import 'package:cafe_finder_fireb/src/constants/sizes.dart';
import 'package:cafe_finder_fireb/src/constants/text_string.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  static const String routeName = 'Welcome';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const WelcomeScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var height = mediaQuery.size.height;
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? tSecondary : cardbg,
      body: Container(
        padding: const EdgeInsets.all(tDefaultSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image(
                image: const AssetImage(tWelcomeScreenImage),
                height: height * 0.3),
            Column(
              children: [
                Text(
                  tWelcomeTitle,
                  style: Theme.of(context).textTheme.headline3,
                  textAlign: TextAlign.center,
                ),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => Navigator.pushNamed(context, 'login'),
                        child: Text(tLogin.toUpperCase()),
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, 'emailview'),
                        child: Text(tSign.toUpperCase()),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
