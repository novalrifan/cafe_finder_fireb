import 'package:cafe_finder_fireb/src/features/core/models/coffeestore_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haversine_distance/haversine_distance.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

import '../../../../../constants/shared/shared_pref.dart';
import '../../../bloc/places_bloc/coffeeshops_bloc.dart';
import 'extend/list_search_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  LatLng latLng = getLatLngFromSharedPrefs();
  final haversineDistance = HaversineDistance();
  late bool _isLoading;
  String tag = r'[A-Z][a-z]';
  void updateList(String value) {}
  @override
  void initState() {
    _isLoading = true;
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            decoration: InputDecoration(
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
              hintText: "eg: Coffee ,  Name ",
              prefixIcon: const Icon(Icons.search_sharp),
            ),
            style: Theme.of(context).textTheme.bodyText1,
            onChanged: (value) {
              setState(() {
                tag = value;
              });
            },
          ),
          const SizedBox(
            height: 20.0,
          ),
          Expanded(
            child: BlocBuilder<CoffeeshopsBloc, CoffeeshopsState>(
              builder: (context, state) {
                if (state is CoffeeshopLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is CoffeeshopLoaded) {
                  return ListView.builder(
                      itemCount: state.coffeeshops.length,
                      itemBuilder: (context, index) {
                        Coffeeshops coffeeshops = state.coffeeshops[index];
                        if (tag.isEmpty) {
                          return Container();
                        }
                        if (coffeeshops.tags.toString().contains(',')
                            ? coffeeshops.tags!
                                .split(',')
                                .toString()
                                .toLowerCase()
                                .contains(RegExp(tag))
                            : coffeeshops.tags
                                .toString()
                                .toLowerCase()
                                .contains(RegExp(tag))) {
                          return _isLoading
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : SearchList(coffeeshops: coffeeshops);
                        }
                        if (coffeeshops.locality
                            .toString()
                            .toLowerCase()
                            .contains(RegExp.escape(tag))) {
                          return _isLoading
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : SearchList(coffeeshops: coffeeshops);
                        }
                        if (coffeeshops.name
                            .toString()
                            .toLowerCase()
                            .contains(RegExp.escape(tag))) {
                          return _isLoading
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : SearchList(coffeeshops: coffeeshops);
                        }
                        return Container();
                      });
                } else {
                  return const Text("Something Is Missing");
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
