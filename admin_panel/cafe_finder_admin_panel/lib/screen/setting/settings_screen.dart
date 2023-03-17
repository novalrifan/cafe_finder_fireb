import 'package:cafe_finder_admin_panel/widget/custom_appbar.dart';
import 'package:cafe_finder_admin_panel/widget/custom_layout.dart';
import 'package:flutter/material.dart';

import '../../config/responsive.dart';
import '../../models/coffeeshop_model.dart';
import '../../widget/custom_text_form_field.dart';
import 'opening_hours.dart';

class SettingScreen extends StatelessWidget {
  static const String routeName = '/settings';
  static Route route({required Coffeeshop coffeeshops}) {
    return MaterialPageRoute(
        builder: (_) => SettingScreen(coffeeshops: coffeeshops));
  }

  final Coffeeshop coffeeshops;
  const SettingScreen({Key? key, required this.coffeeshops}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(titl: 'Setting Screen'),
      body: CustomLayout(
        title: '/${coffeeshops.name.toString()}',
        widgets: [
          _buildImage(),
          Responsive.isDesktop(context) || Responsive.isWideDesktop(context)
              ? IntrinsicHeight(
                  child: Row(
                    children: [
                      Expanded(child: _buildInformation(context)),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(child: _buildAdditional(context)),
                    ],
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildInformation(context),
                    const SizedBox(
                      height: 10,
                    ),
                    _buildAdditional(context),
                  ],
                ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Text(
              'Opening Hours',
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          _buildOpeningHours(context)
        ],
      ),
    );
  }

  _buildOpeningHours(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: coffeeshops.openingHours!.length,
          itemBuilder: (context, index) {
            var openingHours = coffeeshops.openingHours![index];
            return OpeningHoursScreen(
              openingHours: openingHours,
              onSliderChanged: (value) {
                openingHours.copyWith(openAt: value.start, closeAt: value.end);
              },
              onCheckboxChanged: (value) {
                openingHours.copyWith(isOpen: !openingHours.isOpen);
              },
            );
          }),
    );
  }

  Container _buildInformation(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      color: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          Text(
            'Information',
            style: Theme.of(context).textTheme.headline4,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomFormField(
            maxLines: 1,
            title: 'Name',
            hasTitle: true,
            initialValue: coffeeshops.name != null ? coffeeshops.name! : '',
            onChanged: (value) {},
          ),
          CustomFormField(
            maxLines: 1,
            title: 'Images',
            hasTitle: true,
            initialValue:
                coffeeshops.imageUrl != null ? coffeeshops.imageUrl! : '',
            onChanged: (value) {},
          ),
          CustomFormField(
            maxLines: 1,
            title: 'Tags',
            hasTitle: true,
            initialValue: coffeeshops.tags != null ? coffeeshops.tags! : '',
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }

  Container _buildAdditional(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      color: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          Text(
            'Additional',
            style: Theme.of(context).textTheme.headline4,
          ),
          const SizedBox(
            height: 20,
          ),
          // CustomFormField(
          //   maxLines: 1,
          //   title: 'Name',
          //   hasTitle: true,
          //   initialValue: coffeeshops.name != null ? coffeeshops.name! : '',
          //   onChanged: (value) {},
          // ),
          // CustomFormField(
          //   maxLines: 1,
          //   title: 'Images',
          //   hasTitle: true,
          //   initialValue:
          //       coffeeshops.imageUrl != null ? coffeeshops.imageUrl! : '',
          //   onChanged: (value) {},
          // ),
          // CustomFormField(
          //   maxLines: 1,
          //   title: 'Tags',
          //   hasTitle: true,
          //   initialValue: coffeeshops.tags != null ? coffeeshops.tags! : '',
          //   onChanged: (value) {},
          // ),
        ],
      ),
    );
  }

  Container _buildImage() {
    return Container(
      height: 400,
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(coffeeshops.imageUrl.toString()),
              fit: BoxFit.cover)),
    );
  }
}
