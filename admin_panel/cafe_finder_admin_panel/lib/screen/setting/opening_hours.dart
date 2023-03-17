// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:cafe_finder_admin_panel/config/responsive.dart';

import '';
import '../../models/opening_hours.dart';

class OpeningHoursScreen extends StatelessWidget {
  final OpeningHours openingHours;
  final Function(bool?)? onCheckboxChanged;
  final Function(RangeValues)? onSliderChanged;
  const OpeningHoursScreen({
    Key? key,
    required this.openingHours,
    this.onCheckboxChanged,
    this.onSliderChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = Responsive.isMobile(context) ? 110 : 55;
    EdgeInsets padding = Responsive.isDesktop(context)
        ? const EdgeInsets.all(10)
        : const EdgeInsets.all(20);
    return Container(
      height: height,
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10),
      padding: padding,
      color: Theme.of(context).colorScheme.background,
      child: Row(
        children: [
          _buildCheckBox(context),
          const SizedBox(
            height: 10,
          ),
          Expanded(child: _buildSlider(context)),
        ],
      ),
    );
  }

  Row _buildCheckBox(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: openingHours.isOpen,
          onChanged: onCheckboxChanged,
          activeColor: Theme.of(context).colorScheme.primary,
          fillColor: MaterialStateProperty.all(
            Theme.of(context).colorScheme.primary,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        SizedBox(
          width: 100,
          child: Text(
            openingHours.day,
            style: Theme.of(context).textTheme.headline5,
          ),
        )
      ],
    );
  }

  RangeSlider _buildSlider(BuildContext context) {
    return RangeSlider(
        divisions: 24,
        values: RangeValues(openingHours.openAt, openingHours.closeAt),
        min: 0,
        max: 24,
        onChanged: onSliderChanged);
  }
}
