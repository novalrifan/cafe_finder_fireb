import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> screens = {
      'Dashboard': {
        'routeName': '/dash',
        'icon': const Icon(Icons.home_filled),
      },
      'Places Data': {
        'routeName': '--menu',
        'icon': const Icon(Icons.store),
      },
      'Customer Data': {
        'routeName': '--customer',
        'icon': const Icon(Icons.people_alt),
      },
      'Logout': {
        'routeName': '--logout',
        'icon': const Icon(Icons.logout),
      },
    };
    return Drawer(
      child: ListView(
        children: [
          SizedBox(
            height: 65.0,
            child: DrawerHeader(
              decoration:
                  BoxDecoration(color: Theme.of(context).colorScheme.primary),
              child: Text(
                'Admin Panel Drawer',
                style: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(color: Colors.white),
              ),
            ),
          ),
          ...screens.entries.map((screen) {
            return ListTile(
              leading: screen.value['icon'],
              title: Text(screen.key),
              onTap: () {
                Navigator.pushNamed(context, screen.value['routeName']);
              },
            );
          })
        ],
      ),
    );
  }
}
