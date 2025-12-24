import 'package:go_router/go_router.dart';
import 'package:hubx_case/core/storage/sp_helper.dart';
import 'package:hubx_case/features/home/presentation/home_page.dart';
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
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomePage(),
      ),
    ],
    redirect: (context, state) async {
      final sp = await SPHelper.instance();
      final completed = sp.get<bool>(SPKey.onboardingCompleted) ?? false;
      final location = state.uri.toString();

      // If onboarding is completed, redirect away from welcome/onboarding/paywall pages
      if (completed) {
        if (location == '/' || location.startsWith('/onboarding') || location == '/paywall') {
          return '/home';
        }
        // If already at home, allow it
        return null;
      }

      // If onboarding is not completed, redirect away from home
      if (!completed && location == '/home') {
        return '/';
      }

      // Allow all other routes when onboarding is not completed
      return null;
    },
  );
}
