import 'package:go_router/go_router.dart';
import 'package:hubx_case/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:hubx_case/features/onboarding/presentation/pages/paywall_page.dart';
import 'package:hubx_case/features/onboarding/presentation/pages/welcome_page.dart';

class AppRouter {
  AppRouter();

  late final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (context, state) => const WelcomePage(),
      ),
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingPage(),
      ),
      GoRoute(
        path: '/paywall',
        builder: (context, state) => const PaywallPage(),
      ),
    ],
  );
}
