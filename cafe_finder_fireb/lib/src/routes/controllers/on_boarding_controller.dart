// import 'package:get/get.dart';
// import 'package:liquid_swipe/liquid_swipe.dart';

// import '../../../constants/color.dart';
// import '../../../constants/images.dart';
// import '../../../constants/text_string.dart';
// import '../models/model_on_boarding.dart';
// import '../screens/onboarding_screen/on_boarding_widget.dart';

// class OnBoardingController extends GetxController {
//   final controller = LiquidController();
//   RxInt currentPage = 0.obs;

//   final pages = [
//     OnBoardingPageWidget(
//         model: OnBoardingModel(
//             image: tOnBoardingImage1,
//             title: tOnBoardingTitle1,
//             subTitle: tOnBoardingSubTitle1,
//             counterText: tOnBoardingCounter1,
//             bgColor: tOnBoardingPage1Color)),
//     OnBoardingPageWidget(
//         model: OnBoardingModel(
//             image: tOnBoardingImage2,
//             title: tOnBoardingTitle2,
//             subTitle: tOnBoardingSubTitle2,
//             counterText: tOnBoardingCounter2,
//             bgColor: tOnBoardingPage2Color)),
//     OnBoardingPageWidget(
//         model: OnBoardingModel(
//             image: tOnBoardingImage3,
//             title: tOnBoardingTitle3,
//             subTitle: tOnBoardingSubTitle3,
//             counterText: tOnBoardingCounter3,
//             bgColor: tOnBoardingPage3Color))
//   ];

//   next() => controller.jumpToPage(page: 2);
//   animateToNextSlide() {
//     int nextPage = controller.currentPage + 1;
//     controller.animateToPage(page: nextPage);
//   }

//   onPageChangeCallback(int activePageIndex) =>
//       currentPage.value = activePageIndex;
// }
