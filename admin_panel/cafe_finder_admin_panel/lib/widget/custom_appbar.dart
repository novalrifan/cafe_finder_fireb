import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String titl;
  const CustomAppBar({Key? key, required this.titl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        titl,
        style: Theme.of(context).textTheme.headline3!.copyWith(
              color: Colors.white,
            ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
