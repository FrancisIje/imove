part of './utils.dart';

final router = GoRouter(
  initialLocation: '/splash',
  redirect: (context, state) async {
    final isLoggedIn = await AuthService.emailPassword().getUser().then(
      (value) {
        return value != null;
      },
    );
    if (state.path != "/splash" && state.path != null && isLoggedIn == false) {
      return "/login";
    }

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
            builder: (context, state) => ChangeNotifierProvider(
                create: (context) => VerificationViewmodel(),
                child: const VerificationScreen()),
          ),
        ]),
    GoRoute(
      path: '/login',
      builder: (context, state) => ChangeNotifierProvider(
          create: (context) => LoginViewmodel(), child: const LoginScreen()),
    ),
    GoRoute(
      path: '/splash',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/instant-delivery',
      builder: (context, state) => const InstantDelievryScreen(),
    ),
    GoRoute(
      path: '/courier/:type',
      builder: (context, state) {
        final screenType = state.pathParameters['type']!;
        return CourierScreen(type: screenType);
      },
    ),
    GoRoute(
      path: '/add-details/:type',
      builder: (context, state) {
        final type = state.pathParameters['type']!;
        return AddDetailsScreen(
          type: type,
        );
      },
    ),
    GoRoute(
      path: '/confirm-details/:type',
      builder: (context, state) {
        final type = state.pathParameters['type']!;
        return ConfirmDetailsScreen(
          type: type,
        );
      },
    ),
    GoRoute(
      path: '/delivery-details',
      builder: (context, state) => const DeliveryDetailsScreen(),
    ),
    GoRoute(
      path: '/schedule-delivery',
      builder: (context, state) => const SchduleDeliveryScreen(),
    ),
  ],
);
