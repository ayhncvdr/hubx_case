import 'package:go_router/go_router.dart';
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
    ],
  );
}
