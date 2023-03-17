import 'package:cafe_finder_fireb/src/common_widgets/animation/loading_widget.dart';
import 'package:cafe_finder_fireb/src/constants/email_and_password_constant.dart';
import 'package:cafe_finder_fireb/src/features/core/screens/auth/login/reset_passw_view.dart';
import 'package:cafe_finder_fireb/src/features/core/screens/home/home-page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants/constants_export.dart';
import '../../../bloc/blocs.dart';

import '../../../repository/auth_/authuser_error.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool visiblepass = true;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthuserBloc, AuthuserState>(
      builder: (context, state) {
        if (state is AuthUserStateLoggedIn) {
          return const Dashboard();
        }
        if (state is AuthUserStateLoggedOut) {
          return Form(
              child: Container(
            padding: const EdgeInsets.symmetric(vertical: tFormHeight - 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  textInputAction: TextInputAction.next,
                  controller: emailController,
                  autofocus: true,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person_outline_outlined),
                      labelText: tEmail,
                      hintText: tEmail,
                      border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: tFormHeight - 20,
                ),
                TextFormField(
                  onFieldSubmitted: (value) {
                    context.read<AuthuserBloc>().add(AuthUserEventLogin(
                        email: emailController.text,
                        password: passwordController.text));
                  },
                  controller: passwordController,
                  onChanged: (password) {},
                  obscureText: visiblepass,
                  autofocus: true,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock),
                    labelText: tPass,
                    hintText: tPass,
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.remove_red_eye_sharp,
                        color: visiblepass ? greyShade : Colors.amber,
                      ),
                      onPressed: () {
                        setState(() {
                          visiblepass = !visiblepass;
                        });
                      },
                    ),
                  ),
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
                const SizedBox(
                  height: tFormHeight - 25,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {
                        ResetPassView(context);
                      },
                      child: const Text(tForgetPass)),
                ),
                state.isLoading
                    ? const Center(child: LoadingWidgetTwo())
                    : SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            context.read<AuthuserBloc>().add(AuthUserEventLogin(
                                email: emailController.text,
                                password: passwordController.text));
                          },
                          child: Text(
                            tLogin.toUpperCase(),
                            style: Theme.of(context).textTheme.headline5,
                          ),
                        ),
                      ),
              ],
            ),
          ));
        } else {
          return Container();
        }
      },
    );
  }
}
