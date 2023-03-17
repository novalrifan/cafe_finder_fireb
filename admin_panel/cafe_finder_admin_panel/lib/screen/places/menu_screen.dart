import 'package:cafe_finder_admin_panel/screen/places/extend/places.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/places_bloc/coffeeshops_bloc.dart';
import '../../widget/custom_appbar.dart';
import '../../widget/custom_drawer.dart';

class MenuScreen extends StatelessWidget {
  static const String routeName = '--menu';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const MenuScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        titl: 'Places Data',
      ),
      drawer: const CustomDrawer(),
      body: Row(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BlocBuilder<CoffeeshopsBloc, CoffeeshopsState>(
                    builder: (context, state) {
                      if (state is CoffeeshopLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (state is CoffeeshopLoaded) {
                        return PlacesPage(
                          title: '',
                          coffeeshop: state.coffeeshop,
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                  // BlocBuilder<CoffeeshopsBloc, CoffeeshopsState>(
                  //   builder: (context, state) {
                  //     if (state is CoffeeshopLoading) {
                  //       return const Center(
                  //         child: CircularProgressIndicator(),
                  //       );
                  //     }
                  //     if (state is CoffeeshopLoaded) {
                  //       return
                  //       SizedBox(
                  //           width: double.infinity,
                  //           child: DataTable(
                  //             columns: const [
                  //               DataColumn(label: Text('Name')),
                  //               DataColumn(label: Text('Tags')),
                  //               DataColumn(label: Text('Description')),
                  //               DataColumn(label: Text('Action')),
                  //             ],
                  //             rows: state.coffeeshop.map((e) {
                  //               return DataRow(
                  //                 cells: [
                  //                   DataCell(
                  //                     Text(
                  //                       e.name.toString(),
                  //                       style: Theme.of(context)
                  //                           .textTheme
                  //                           .bodyText1,
                  //                     ),
                  //                   ),
                  //                   DataCell(
                  //                     Text(e.tags.toString(),
                  //                         style: Theme.of(context)
                  //                             .textTheme
                  //                             .bodyText1),
                  //                   ),
                  //                   DataCell(
                  //                     Text(e.description.toString(),
                  //                         style: Theme.of(context)
                  //                             .textTheme
                  //                             .bodyText1),
                  //                   ),
                  //                   DataCell(InkWell(
                  //                     onTap: () {
                  //                       Navigator.push(
                  //                           context,
                  //                           MaterialPageRoute(
                  //                               builder: (context) =>
                  //                                   SettingScreen(
                  //                                     coffeeshops: e,
                  //                                   )));
                  //                     },
                  //                     child: const Icon(Icons.settings),
                  //                   ))
                  //                 ],
                  //               );
                  //             }).toList(),
                  //           ));
                  //     } else {
                  //       return Container();
                  //     }
                  //   },
                  // )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
