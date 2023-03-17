import 'package:cafe_finder_fireb/src/common_widgets/animation/loading_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants/constants_export.dart';
import '../../../bloc/appuser/authuser_bloc.dart';
import '../../home/home-page.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthuserBloc, AuthuserState>(
      builder: (context, state) {
        if (state is AuthUserStateLoggedIn) {
          return const Dashboard();
        }
        if (state is AuthUserStateLoggedOut) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("Or"),
                  const SizedBox(
                    height: 5,
                  ),
                  state.isLoading
                      ? const Center(child: LoadingWidgetTwo())
                      : SizedBox(
                          width: double.infinity,
                          child: OutlinedButton.icon(
                            icon: const Image(
                              image: AssetImage(tLogoGoogle),
                              width: 20.0,
                            ),
                            onPressed: () {
                              context
                                  .read<AuthuserBloc>()
                                  .add(const AuthUserEventWithGoogle());
                            },
                            label: const Text(tSigninGoogle),
                          ),
                        ),
                  const SizedBox(
                    height: tFormHeight - 20,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'emailview');
                    },
                    child: Text.rich(
                      TextSpan(
                          text: tDontHaveAccount,
                          style: Theme.of(context).textTheme.bodyText1,
                          children: const [
                            TextSpan(
                              text: tSign,
                              style: TextStyle(color: Colors.blue),
                            )
                          ]),
                    ),
                  ),
                ],
              )
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }
}
