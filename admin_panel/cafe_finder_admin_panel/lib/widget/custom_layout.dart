import 'package:flutter/material.dart';

class CustomLayout extends StatelessWidget {
  const CustomLayout({
    Key? key,
    required this.title,
    required this.widgets,
  }) : super(key: key);
  final String title;
  final List<Widget> widgets;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 4,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ...widgets,
                  const SizedBox(
                    height: 20,
                  ),
                  // Container(
                  //   width: double.infinity,
                  //   constraints: const BoxConstraints(minHeight: 75),
                  //   color: Theme.of(context).colorScheme.primary,
                  //   child: const Center(child: Text('Some ads here..')),
                  // )
                ],
              ),
            ),
          ),
        ),
        // Responsive.isWideDesktop(context) || Responsive.isDesktop(context)
        //     ? Expanded(
        //         flex: 1,
        //         child: Container(
        //           margin: const EdgeInsets.only(top: 20, bottom: 20, right: 20),
        //           color: Theme.of(context).colorScheme.background,
        //           child: const Center(child: Text('Some ads here..')),
        //         ),
        //       )
        //     : const SizedBox(),
      ],
    );
  }
}
