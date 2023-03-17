// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final int maxLines;
  final String title;
  final bool hasTitle;
  final String initialValue;
  final Function(String)? onChanged;
  const CustomFormField({
    Key? key,
    required this.maxLines,
    required this.title,
    required this.hasTitle,
    required this.initialValue,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: [
          hasTitle
              ? SizedBox(
                  width: 75,
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                )
              : const SizedBox(),
          Expanded(
            child: TextFormField(
              maxLines: maxLines,
              initialValue: initialValue,
              onChanged: onChanged,
              onEditingComplete: () {
                print('Done');
              },
              decoration: InputDecoration(
                  isDense: true,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.background),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
