import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:imove/utiils/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.fadeIn(
      asyncNavigationCallback: () async {
        await Future.delayed(const Duration(seconds: 3)).then(
          (value) => context.go("/onboarding"),
        );
      },
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
      // nextScreen: const OnboardingScreen(),
    );
  }
}
