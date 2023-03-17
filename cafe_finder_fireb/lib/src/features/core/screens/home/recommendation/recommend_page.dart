import 'package:cafe_finder_fireb/src/common_widgets/animation/loading_widget.dart';
import 'package:cafe_finder_fireb/src/constants/constants_export.dart';
import 'package:cafe_finder_fireb/src/features/core/bloc/blocs.dart';
import 'package:cafe_finder_fireb/src/features/core/screens/home/list-page/extend/dummy.dart';

import 'package:cafe_finder_fireb/src/features/core/screens/home/widgets/home_searchbox_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:cafe_finder_fireb/src/features/core/screens/home/widgets/header_image_widget.dart';

class WithMethod extends StatefulWidget {
  const WithMethod({
    Key? key,
  }) : super(key: key);

  @override
  State<WithMethod> createState() => _WithMethodState();
}

class _WithMethodState extends State<WithMethod> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;
    TabController tabController = TabController(
        animationDuration: const Duration(seconds: 2), length: 1, vsync: this);
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(tDashboardPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tDashboardTitle,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            Text(
              tDashboardHeading,
              style: Theme.of(context).textTheme.headline2,
            ),
            const SizedBox(
              height: tDashboardPadding + 10,
            ),
            SizedBox(
              height: 55,
              child: ListView(
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  // ButtonAddField(),
                  DashboardSearchBox(),
                  SizedBox(
                    height: tDashboardPadding,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: tDashboardPadding,
            ),
            Container(
              color: Colors.transparent,
              child: Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                  indicatorColor: isDarkMode ? Colors.amber.shade600 : tEals,
                  labelPadding: const EdgeInsets.only(
                      left: tDashboardPadding, right: tDashboardPadding),
                  labelColor: isDarkMode ? white : black,
                  unselectedLabelColor:
                      isDarkMode ? Colors.white24 : Colors.black26,
                  controller: tabController,
                  isScrollable: true,
                  labelStyle: Theme.of(context).textTheme.headline4,
                  tabs: const [
                    Tab(
                      text: 'Recommendation',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: tDashboardCardPadding,
            ),
            Container(
                height: 400,
                width: double.maxFinite,
                color: Colors.transparent,
                child: TabBarView(controller: tabController, children: [
                  // ---- All Place
                  BlocBuilder<MabacMethodBloc, MabacMethodState>(
                    builder: (context, state) {
                      if (state is MabacMethodLoading) {
                        return const Center(
                          child: LoadingWidget(),
                        );
                      }
                      if (state is MabacMethodLoaded) {
                        return SizedBox(
                          width: double.infinity,
                          height: 400,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(right: 0, bottom: 5.0),
                            child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: state.coffeeshops.length,
                                itemBuilder: (context, index) {
                                  final newStateOf = state.coffeeshops;
                                  // final c1 =
                                  //     newStateOf[index].cFaciility!.toDouble();
                                  // final c2 =
                                  //     newStateOf[index].cRate!.toDouble();
                                  // final c3 =
                                  //     newStateOf[index].cPrice!.toDouble();
                                  // final c4 =
                                  //     newStateOf[index].cDistance!.toDouble();

                                  // List<double> x = [
                                  //   (c1 - 10 / 50 - 10),
                                  //   (c2 - 10 / 70 - 10),
                                  //   (c3 - 70 / 10 - 70),
                                  //   (c4 - 70 / 10 - 70),
                                  // ];

                                  // List<double> vij = [
                                  //   (0.4 * x[0]) + 0.4,
                                  //   (0.3 * x[1]) + 0.3,
                                  //   (0.4 * x[2]) + 0.4,
                                  //   (0.3 * x[3] + 0.3),
                                  // ];

                                  // double record = vij.reduce((a, b) => a * b);

                                  return Dummy(
                                    coffeeshops: newStateOf[index],
                                  );
                                }),
                          ),
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),

                  //---- Sort by Rate
                ])),
          ],
        ),
      ),
    );
  }
}
