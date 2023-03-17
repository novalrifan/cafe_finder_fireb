import 'package:cafe_finder_fireb/src/constants/sizes.dart';
import 'package:cafe_finder_fireb/src/constants/text_string.dart';
import 'package:cafe_finder_fireb/src/features/core/bloc/appuser/authuser_bloc.dart';
import 'package:cafe_finder_fireb/src/constants/email_and_password_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                label: Text(tFullname),
                prefixIcon: Icon(Icons.person_outline_rounded),
              ),
            ),
            const SizedBox(
              height: tFormHeight - 20,
            ),
            BlocBuilder<AuthuserBloc, AuthuserState>(
              builder: (context, state) {
                return TextFormField(
                  decoration: const InputDecoration(
                    label: Text(tEmail),
                    prefixIcon: Icon(Icons.email_outlined),
                  ),
                  controller: emailController,
                  onFieldSubmitted: ((value) {
                    // ignore: invalid_use_of_visible_for_testing_member
                    context.read<AuthuserBloc>().emit(AuthUserStateLoggedOut(
                        isLoading: false, successful: false));
                  }),
                );
              },
            ),
            const SizedBox(
              height: tFormHeight - 20,
            ),
            TextFormField(
              decoration: const InputDecoration(
                label: Text(tPhone),
                prefixIcon: Icon(Icons.phone_android_outlined),
              ),
            ),
            const SizedBox(
              height: tFormHeight - 20,
            ),
            TextFormField(
              controller: passwordController,
              obscureText: false,
              autofocus: true,
              decoration: const InputDecoration(
                label: Text(tPass),
                prefixIcon: Icon(Icons.password_outlined),
              ),
            ),
            const SizedBox(
              height: tFormHeight - 20,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {}, child: Text(tSign.toUpperCase())),
            )
          ],
        ),
      ),
    );
  }
}
