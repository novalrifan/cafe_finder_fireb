import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;
    return LoadingAnimationWidget.staggeredDotsWave(
        color: isDarkMode ? Colors.black38 : Colors.white54, size: 50);
  }
}

class LoadingWidgetTwo extends StatelessWidget {
  const LoadingWidgetTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;
    return LoadingAnimationWidget.twoRotatingArc(
        color: isDarkMode ? Colors.black38 : Colors.white54, size: 50);
  }
}

class LoadingWidgetHorizontal extends StatelessWidget {
  const LoadingWidgetHorizontal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;
    return LoadingAnimationWidget.horizontalRotatingDots(
        color: isDarkMode ? Colors.black38 : Colors.white54, size: 50);
  }
}

class LoadingWidgetWave extends StatelessWidget {
  const LoadingWidgetWave({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;
    return LoadingAnimationWidget.waveDots(
        color: isDarkMode ? Colors.black38 : Colors.white70, size: 50);
  }
}
