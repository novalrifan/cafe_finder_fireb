import 'package:cafe_finder_fireb/src/constants/color.dart';
import 'package:cafe_finder_fireb/src/constants/email_and_password_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/appuser/authuser_bloc.dart';

class PasswordView extends StatefulWidget {
  static const String routeName = 'passview';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const PasswordView(),
      settings: const RouteSettings(name: routeName),
    );
  }

  const PasswordView({Key? key}) : super(key: key);

  @override
  State<PasswordView> createState() => _PasswordViewState();
}

class _PasswordViewState extends State<PasswordView> {
  bool visiblepass = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: black,
        ),
        elevation: 0,
        backgroundColor: white.withOpacity(0),
      ),
      body: Center(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 50),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, bottom: 25),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Type your Password Here',
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Text(
                      'Type your password to create an account',
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            color: Colors.grey.shade500,
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
                      Icons.password_sharp,
                      color: Colors.grey.shade500,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    SizedBox(
                      height: 50,
                      width: 250,
                      child: TextField(
                        controller: passwordController,
                        obscureText: visiblepass,
                        autofocus: true,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                visiblepass = !visiblepass;
                              });
                            },
                            icon: Icon(
                              Icons.remove_red_eye,
                              color: visiblepass
                                  ? Colors.grey.shade500
                                  : Colors.amber,
                            ),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.amber,
                            ),
                          ),
                          hintText: 'Password',
                          hintStyle: TextStyle(color: Colors.grey.shade500),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade500),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            BlocBuilder<AuthuserBloc, AuthuserState>(
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Align(
                    alignment: Alignment.center,
                    child: state.isLoading
                        ? const CircularProgressIndicator()
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: SizedBox(
                              width: 250,
                              height: 50,
                              child: MaterialButton(
                                onPressed: () {
                                  context.read<AuthuserBloc>().add(
                                      AuthUserEventRegister(
                                          email: emailController.text,
                                          password: passwordController.text));
                                  Navigator.of(context)
                                      .popUntil((route) => route.isFirst);
                                },
                                color: Colors.amber,
                                child: const Text('Confirm'),
                              ),
                            ),
                          ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
