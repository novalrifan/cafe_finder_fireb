import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/user_bloc/user_bloc.dart';
import '../../widget/custom_appbar.dart';
import '../../widget/custom_drawer.dart';

class CScreen extends StatelessWidget {
  const CScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        titl: 'Customer Data',
      ),
      drawer: const CustomDrawer(),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BlocBuilder<UserBloc, UserState>(
                    builder: (context, state) {
                      if (state is UserLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (state is UserLoaded) {
                        return SizedBox(
                            width: double.infinity,
                            child: DataTable(
                              columns: const [
                                DataColumn(label: Text('Name')),
                                DataColumn(label: Text('Provider')),
                                DataColumn(label: Text('Email')),
                                DataColumn(label: Text('Action')),
                              ],
                              rows: state.customer.map((e) {
                                return DataRow(
                                  cells: [
                                    DataCell(
                                      Text(
                                        e.name.toString(),
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        e.providers.toString(),
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        e.email.toString(),
                                      ),
                                    ),
                                    DataCell(InkWell(
                                      onTap: () {
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (context) =>
                                        //             SettingScreen(
                                        //               User: e,
                                        //             )));
                                      },
                                      child: const Icon(Icons.settings),
                                    ))
                                  ],
                                );
                              }).toList(),
                            ));
                      } else {
                        return Container();
                      }
                    },
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
