import 'package:cafe_finder_fireb/src/common_widgets/form/form_header_widget.dart';
import 'package:cafe_finder_fireb/src/constants/images_source.dart';
import 'package:cafe_finder_fireb/src/constants/sizes.dart';
import 'package:cafe_finder_fireb/src/constants/text_string.dart';
import 'package:flutter/material.dart';

import 'widgets/sign_up_form_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              children: [
                const FormHeaderWidget(
                  image: tWelcomeScreenImage,
                  title: tSignUpTitle,
                  subTitle: tSignupSubTitle,
                ),
                const SignUpFormWidget(),
                Column(
                  children: [
                    const Text(" OR "),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Image(
                          image: AssetImage(tLogoGoogle),
                          width: 20.0,
                        ),
                        label: Text(tSigninGoogle.toUpperCase()),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                                text: tAlreadyhaveAcc,
                                style: Theme.of(context).textTheme.bodyText1),
                            TextSpan(text: tLogin.toUpperCase()),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
