part of './utils.dart';

final router = GoRouter(
  initialLocation: '/splash',
  redirect: (context, state) {
    // final isLoggedIn = AuthService.emailPassword().isUserLoggedIn;
    // if (state.path != "/splash" && state.path != null && isLoggedIn == false) {
    //   return "/login";
    // }

    return null;
  },
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Home(),
    ),
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
        path: '/register',
        builder: (context, state) => const SignUpScreen(),
        routes: [
          GoRoute(
            path: '/verify',
            builder: (context, state) => const VerificationScreen(),
          ),
        ]),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/splash',
      builder: (context, state) => const SplashScreen(),
    ),
    //  GoRoute(
    //   path: '/instant-delivery',
    //   builder: (context, state) => const (),
    // ),
    //  GoRoute(
    //   path: '/schedule-delivery',
    //   builder: (context, state) => const (),
    // ),
  ],
);
