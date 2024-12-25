import 'package:firebase_core/firebase_core.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imove/firebase_options.dart';
import 'package:imove/services/map/map.dart';
import 'package:imove/utiils/utils.dart';
import 'package:imove/view_models/history_viewmodel.dart';
import 'package:imove/view_models/home_viewmodel.dart';
import 'package:imove/view_models/location_viewmodel.dart';
import 'package:imove/view_models/sign_up_viewmodel.dart';
import 'package:imove/view_models/user_viewmodel.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => UserViewmodel(),
      ),
      ChangeNotifierProvider(
        create: (context) => HistoryViewmodel(),
      ),
      ChangeNotifierProvider(
        create: (context) => LocationViewmodel(),
      ),
      ChangeNotifierProvider(
        create: (context) => MapApi(),
      ),
      ChangeNotifierProvider(
        create: (context) => SignUpViewmodel(),
      ),
      ChangeNotifierProxyProvider2<UserViewmodel, HistoryViewmodel,
          HomeViewmodel>(
        create: (_) => HomeViewmodel(
            Provider.of<UserViewmodel>(_, listen: false),
            Provider.of<HistoryViewmodel>(_, listen: false)),
        update: (_, userViewModel, historyViewModel, previousViewModel) =>
            HomeViewmodel(userViewModel, historyViewModel),
      ),
    ],
    child: const IMoveApp(),
  ));
}

class IMoveApp extends StatelessWidget {
  const IMoveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) {
          return MaterialApp.router(
            routerConfig: router,
            theme: FlexThemeData.light(colors: AppColors.scheme).copyWith(
              scaffoldBackgroundColor: AppColors.backgroundColor,
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ButtonStyle(
                    textStyle: WidgetStatePropertyAll(
                        AppTypography.avenir().bodyLargeSB),
                    fixedSize:
                        WidgetStatePropertyAll(Size(double.maxFinite, 50.h)),
                    backgroundColor:
                        const WidgetStatePropertyAll(AppColors.primaryColor),
                    foregroundColor:
                        const WidgetStatePropertyAll(Colors.white)),
              ),
            ),
          );
        });
  }
}
