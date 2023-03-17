import 'package:cafe_finder_fireb/src/constants/color.dart';
import 'package:cafe_finder_fireb/src/constants/email_and_password_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/appuser/authuser_bloc.dart';

// ignore: non_constant_identifier_names
void ResetPassView(BuildContext context) {
  var textS = Theme.of(context);
  showModalBottomSheet(
      context: context,
      builder: (context) => SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Container(
                        height: 5,
                        width: 50,
                        color: greyShade,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, top: 25),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Reset Password',
                            style: textS.textTheme.headline1!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: greyShade,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.alternate_email_outlined,
                                  color: greyShade,
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                SizedBox(
                                  width: 250,
                                  height: 50,
                                  child: TextField(
                                    controller: emailController,
                                    decoration: const InputDecoration(
                                      hintText: 'E-mail',
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.amber,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25, bottom: 25),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: SizedBox(
                          height: 50,
                          width: 200,
                          child: BlocBuilder<AuthuserBloc, AuthuserState>(
                            builder: (context, state) {
                              return MaterialButton(
                                onPressed: () {
                                  context.read<AuthuserBloc>().add(
                                      AuthUserEventResetPassword(
                                          email: emailController.text));
                                  Navigator.pop(context);
                                  showDialog(
                                    context: context,
                                    builder: (context) => CupertinoAlertDialog(
                                      title:
                                          const Text('E-mail has been sended'),
                                      content: const Text(
                                          'Your password recovery link was send to E-mail provided '),
                                      actions: [
                                        CupertinoDialogAction(
                                          child: const Text('Ok'),
                                          onPressed: () =>
                                              Navigator.pop(context),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                child: const Text('Send'),
                              );
                            },
                          ),
                        )),
                  ),
                ],
              ),
            ),
          ));
}
