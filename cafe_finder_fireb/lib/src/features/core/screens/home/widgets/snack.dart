import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSnack extends StatelessWidget {
  const CustomSnack({
    Key? key,
    required this.text,
    required this.color,
    required this.notify,
    required this.color2,
  }) : super(key: key);
  final String notify;
  final String text;
  final Color color;
  final Color color2;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          height: 90,
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
          child: Row(
            children: [
              const SizedBox(
                width: 48,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const Spacer(),
                    Text(
                      notify,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          child: ClipRRect(
            borderRadius:
                const BorderRadius.only(bottomLeft: Radius.circular(20)),
            child: SvgPicture.asset(
              'assets/icons/bubbles.svg',
              height: 48,
              width: 40,
              color: color2,
            ),
          ),
        ),
        Positioned(
          top: -20,
          left: 0,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/fail.svg',
                height: 40,
              ),
              Positioned(
                top: 10,
                child: SvgPicture.asset(
                  'assets/icons/close.svg',
                  height: 16,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
