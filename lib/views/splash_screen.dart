import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:imove/utiils/colors.dart';
import 'package:imove/views/onboarding.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.fadeIn(
      backgroundColor: AppColors.backgroundColor,
      onInit: () {
        debugPrint("On Init");
      },
      onEnd: () {
        debugPrint("On End");
      },
      childWidget: AspectRatio(
          aspectRatio: 2, child: Image.asset("assets/images/imove_logo.png")),
      onAnimationEnd: () => debugPrint("On Fade In End"),
      nextScreen: const OnboardingScreen(),
    );
  }
}
