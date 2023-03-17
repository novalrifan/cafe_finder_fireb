import 'package:cafe_finder_fireb/src/constants/color.dart';
import 'package:cafe_finder_fireb/src/features/core/bloc/appuser/authuser_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardAppbar extends StatefulWidget implements PreferredSizeWidget {
  const DashboardAppbar({
    Key? key,
    this.appTitle = '',
    this.leading,
    this.titleWidget,
  }) : super(key: key);
  final String appTitle;
  final Widget? leading;
  final Widget? titleWidget;

  @override
  State<DashboardAppbar> createState() => _DashboardAppbarState();

  @override
  Size get preferredSize => const Size.fromHeight(55);
}

class _DashboardAppbarState extends State<DashboardAppbar> {
  signOut() async {
    Navigator.of(context)
        .pushNamedAndRemoveUntil('controller', ModalRoute.withName('login'));
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const Icon(
        Icons.menu,
        color: black,
      ),
      title: Text(
        widget.appTitle,
        style: Theme.of(context).textTheme.headline4,
      ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      actions: [
        Container(
            margin: const EdgeInsets.only(right: 20, top: 7),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.transparent,
              // color: cardbg,
            ),
            child: BlocBuilder<AuthuserBloc, AuthuserState>(
                builder: ((context, state) {
              return PopupMenuButton(
                padding: const EdgeInsets.all(10),
                elevation: 0,
                enabled: true,
                icon: const Icon(
                  Icons.settings,
                  color: black,
                ),
                shape:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                itemBuilder: ((context) => [
                      const PopupMenuItem(child: Text('Profile')),
                      const PopupMenuItem(child: Text('Settings')),
                      PopupMenuItem(
                        onTap: () async {
                          context
                              .read<AuthuserBloc>()
                              .add(const AuthUserEventLogout());
                          await signOut();
                        },
                        child: const Text('Logout'),
                      ),
                    ]),
              );
            }))),
      ],
    );
  }
}
