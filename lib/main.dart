import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imove/utiils/utils.dart';
import 'package:imove/views/splash_screen.dart';

void main() {
  runApp(const IMoveApp());
}

class IMoveApp extends StatelessWidget {
  const IMoveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) {
          return MaterialApp(
            // theme: FlexThemeData.light(scheme: FlexScheme.mandyRed),
            theme: FlexThemeData.light(colors: AppColors.scheme).copyWith(
              scaffoldBackgroundColor: AppColors.backgroundColor,
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ButtonStyle(
                    fixedSize:
                        WidgetStatePropertyAll(Size(double.maxFinite, 50.h)),
                    backgroundColor:
                        WidgetStatePropertyAll(AppColors.primaryColor),
                    foregroundColor: WidgetStatePropertyAll(Colors.white)),
              ),
            ),
            home: const SplashScreen(),
          );
        });
  }
}
