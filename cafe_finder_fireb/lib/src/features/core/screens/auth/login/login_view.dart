import 'package:cafe_finder_fireb/src/constants/color.dart';
import 'package:cafe_finder_fireb/src/features/core/bloc/appuser/authuser_bloc.dart';
import 'package:cafe_finder_fireb/src/constants/email_and_password_constant.dart';
import 'package:cafe_finder_fireb/src/features/core/repository/auth_/authuser_error.dart';
import 'package:cafe_finder_fireb/src/features/core/screens/home/home-page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'reset_passw_view.dart';

class LoginView extends StatefulWidget {
  static const String routeName = 'loginview';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const LoginView(),
      settings: const RouteSettings(name: routeName),
    );
  }

  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool visiblepass = true;
  // ignore: non_constant_identifier_names

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var textS = Theme.of(context).textTheme;
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    return BlocBuilder<AuthuserBloc, AuthuserState>(
      builder: (context, state) {
        if (state is AuthUserStateLoggedIn) {
          return const Dashboard();
        }
        if (state is AuthUserStateLoggedOut) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: isDarkMode ? tSecondary : white,
              iconTheme: const IconThemeData(),
              elevation: 0,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 50),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 25,
                      bottom: 25,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Login',
                            style: textS.headline1!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Type your E-mail and Password',
                            style: textS.bodyText1!.copyWith(
                              color: greyShade,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
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
                            child: TextField(
                              controller: emailController,
                              autofocus: true,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                  focusedBorder: const UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.teal)),
                                  hintText: 'E-mail',
                                  hintStyle: TextStyle(color: greyShade),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                    color: greyShade,
                                  ))),
                            ),
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
                              Icons.password_rounded,
                              color: greyShade,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            SizedBox(
                              height: 50,
                              width: 250,
                              child: TextField(
                                onSubmitted: (value) {
                                  context.read<AuthuserBloc>().add(
                                      AuthUserEventLogin(
                                          email: emailController.text,
                                          password: passwordController.text));
                                },
                                controller: passwordController,
                                autofocus: true,
                                obscureText: visiblepass,
                                decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        Icons.remove_red_eye,
                                        color: visiblepass
                                            ? greyShade
                                            : Colors.amber,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          visiblepass = !visiblepass;
                                        });
                                      },
                                    ),
                                    focusedBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.amber,
                                      ),
                                    ),
                                    hintText: 'Password',
                                    hintStyle: TextStyle(
                                      color: greyShade,
                                    )),
                              ),
                            )
                          ],
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: authErrorLogin != ''
                        ? Text(
                            textAlign: TextAlign.center,
                            authErrorLogin.split(']')[1],
                            style: const TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : null,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          state.isLoading
                              ? const CircularProgressIndicator()
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: SizedBox(
                                    width: 250,
                                    height: 50,
                                    child: MaterialButton(
                                      onPressed: () {
                                        context.read<AuthuserBloc>().add(
                                            AuthUserEventLogin(
                                                email: emailController.text,
                                                password:
                                                    passwordController.text));
                                      },
                                      color: Colors.teal,
                                      child: const Text('Login'),
                                    ),
                                  ),
                                ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: TextButton(
                                onPressed: () {
                                  ResetPassView(context);
                                },
                                child: const Text('Forgot Password?')),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
