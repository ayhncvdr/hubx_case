import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hubx_case/core/storage/sp_helper.dart';
import 'package:hubx_case/features/home/data/repositories/home_repository_impl.dart';
import 'package:hubx_case/features/home/domain/usecases/get_categories_usecase.dart';
import 'package:hubx_case/features/home/domain/usecases/get_questions_usecase.dart';
import 'package:hubx_case/features/home/presentation/bloc/home_bloc.dart';
import 'package:hubx_case/features/landing/presentation/bloc/plant_landing_bloc.dart';
import 'package:hubx_case/features/landing/presentation/pages/plant_landing_page.dart';
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
        builder: (context, state) {
          final repository = HomeRepositoryImpl();

          return MultiBlocProvider(
            providers: [
              BlocProvider<HomeBloc>(
                create: (context) => HomeBloc(
                  getCategoriesUseCase: GetCategoriesUseCase(repository),
                  getQuestionsUseCase: GetQuestionsUseCase(repository),
                )..add(const HomeEventLoadData()),
              ),
              BlocProvider<PlantLandingBloc>(
                create: (context) => PlantLandingBloc(),
              ),
            ],
            child: const PlantLandingPage(),
          );
        },
      ),
    ],
    redirect: (context, state) async {
      final sp = await SPHelper.instance();
      final completed = sp.get<bool>(SPKey.onboardingCompleted) ?? false;
      final location = state.uri.toString();

      // If onboarding is completed, redirect away from welcome/onboarding pages
      // Allow paywall access from home screen
      if (completed) {
        if (location == '/' || location.startsWith('/onboarding')) {
          return '/home';
        }
        // Allow paywall and home when onboarding is completed
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
