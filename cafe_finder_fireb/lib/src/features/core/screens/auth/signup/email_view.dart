import 'package:cafe_finder_fireb/src/constants/color.dart';
import 'package:cafe_finder_fireb/src/constants/email_and_password_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

import '../../../bloc/appuser/authuser_bloc.dart';
import 'password_view.dart';

class EmailView extends StatelessWidget {
  static const String routeName = 'emailview';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const EmailView(),
      settings: const RouteSettings(name: routeName),
    );
  }

  const EmailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var textS = Theme.of(context).textTheme;
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDarkMode ? tSecondary : cardbg,
        iconTheme: const IconThemeData(),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25, bottom: 25, top: 50),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Insert your E-mail',
                      style: textS.headline4,
                    ),
                    Text(
                      'Insert Your E-mail to create an account',
                      style: textS.bodyText2!.copyWith(color: greyShade),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 25,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Icon(
                      Icons.alternate_email_rounded,
                      color: greyShade,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    SizedBox(
                      height: 50,
                      width: 250,
                      child: BlocBuilder<AuthuserBloc, AuthuserState>(
                        builder: (context, state) {
                          return TextField(
                            controller: emailController,
                            onSubmitted: (value) {
                              // ignore: invalid_use_of_visible_for_testing_member
                              context.read<AuthuserBloc>().emit(
                                    AuthUserStateLoggedOut(
                                        isLoading: false, successful: false),
                                  );
                              Navigator.push(
                                context,
                                PageTransition(
                                  child: const PasswordView(),
                                  type: PageTransitionType.fade,
                                  duration: const Duration(milliseconds: 250),
                                ),
                              );
                            },
                            autofocus: true,
                            decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: tEals)),
                                hintText: 'E-mail',
                                hintStyle: TextStyle(
                                  color: greyShade,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: greyShade),
                                )),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50, right: 25),
              child: Align(
                alignment: Alignment.bottomRight,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: SizedBox(
                    width: 70,
                    height: 70,
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            child: const PasswordView(),
                            type: PageTransitionType.fade,
                            duration: const Duration(milliseconds: 250),
                          ),
                        );
                      },
                      color: tEals,
                      child: const Icon(Icons.navigate_next),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
