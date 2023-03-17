import 'package:cafe_finder_fireb/src/common_widgets/animation/loading_widget.dart';
import 'package:cafe_finder_fireb/src/constants/color.dart';

import 'package:cafe_finder_fireb/src/features/core/screens/home/widgets/home_searchbox_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cafe_finder_fireb/src/constants/sizes.dart';
import 'package:cafe_finder_fireb/src/constants/text_string.dart';
import 'package:cafe_finder_fireb/src/features/core/screens/home/list-page/extend/list-card.dart';
// import 'package:cafe_finder_fireb/src/features/core/screens/home/widgets/header_image_widget.dart';

import '../../../bloc/places_bloc/by_distance/by_distance_bloc.dart';
import '../../../bloc/places_bloc/by_price/by_price_bloc.dart';
import '../../../bloc/places_bloc/by_rate/byrate_bloc.dart';
import '../../../bloc/places_bloc/coffeeshops_bloc.dart';

class PlacesList extends StatefulWidget {
  const PlacesList({
    Key? key,
  }) : super(key: key);

  @override
  State<PlacesList> createState() => _PlacesListState();
}

class _PlacesListState extends State<PlacesList> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;
    TabController tabController = TabController(
        animationDuration: const Duration(seconds: 2), length: 4, vsync: this);
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
                      text: 'All',
                    ),
                    Tab(
                      text: 'Top Rated',
                    ),
                    Tab(
                      text: 'Nearest',
                    ),
                    Tab(
                      text: 'Lowest Price',
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
                  BlocBuilder<CoffeeshopsBloc, CoffeeshopsState>(
                    builder: (context, state) {
                      if (state is CoffeeshopLoading) {
                        return const Center(
                          child: LoadingWidget(),
                        );
                      }
                      if (state is CoffeeshopLoaded) {
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

                                  return CardWidget(
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

                  BlocBuilder<ByRateBloc, ByRateState>(
                    builder: (context, state) {
                      if (state is ByRateLoading) {
                        return const Center(
                          child: LoadingWidget(),
                        );
                      }
                      if (state is ByRateLoaded) {
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
                                  // final rate = newStateOfRate[index].average ??
                                  //     0.0.toDouble();
                                  // if (rate > 4.0) {
                                  //   newStateOfRate.sort(((a, b) => a.average!
                                  //       .toDouble()
                                  //       .compareTo(b.average!.toDouble())));
                                  return CardWidget(
                                    coffeeshops: state.coffeeshops[index],
                                  );
                                }),
                          ),
                        );
                      } else {
                        return const Text('Something is missing');
                      }
                    },
                  ),

                  //---- Sort by Distance

                  BlocBuilder<ByDistanceBloc, ByDistanceState>(
                    builder: (context, state) {
                      if (state is ByDistanceLoading) {
                        return const Center(
                          child: LoadingWidget(),
                        );
                      }
                      if (state is ByDistanceLoaded) {
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
                                  final dist =
                                      state.coffeeshops[index].distance ??
                                          0.0.toDouble();
                                  final newStateOfDistance = state.coffeeshops;
                                  if (dist < 2.0) {
                                    newStateOfDistance.sort(((a, b) =>
                                        a.distance!.compareTo(b.distance!)));
                                    return CardWidget(
                                      coffeeshops: newStateOfDistance[index],
                                    );
                                  }
                                  return Container();
                                }),
                          ),
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),

                  //---- Sort by Lowest Price

                  BlocBuilder<ByPriceBloc, ByPriceState>(
                    builder: (context, state) {
                      if (state is ByPriceLoading) {
                        return const Center(
                          child: LoadingWidget(),
                        );
                      }
                      if (state is ByPriceLoaded) {
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
                                  final newStateOfPrice = state.coffeeshops;

                                  newStateOfPrice[index].forTwo ?? 0.toInt();

                                  newStateOfPrice.sort(((a, b) =>
                                      a.forTwo!.compareTo(b.forTwo!)));
                                  return CardWidget(
                                    coffeeshops: newStateOfPrice[index],
                                  );
                                }),
                          ),
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                ])),
          ],
        ),
      ),
    );
  }
}
