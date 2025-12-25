import 'package:get_it/get_it.dart';
import 'package:hubx_case/core/network/network_manager.dart';
import 'package:hubx_case/core/storage/sp_helper.dart';
import 'package:hubx_case/features/home/data/datasources/home_remote_datasource.dart';
import 'package:hubx_case/features/home/data/repositories/home_repository_impl.dart';
import 'package:hubx_case/features/home/domain/repositories/home_repository.dart';
import 'package:hubx_case/features/home/domain/usecases/get_categories_usecase.dart';
import 'package:hubx_case/features/home/domain/usecases/get_questions_usecase.dart';
import 'package:hubx_case/features/home/presentation/bloc/home_bloc.dart';
import 'package:hubx_case/features/landing/presentation/bloc/plant_landing_bloc.dart';
import 'package:hubx_case/features/onboarding/presentation/bloc/onboarding_bloc.dart';

final getIt = GetIt.instance;

Future<void> setupDependencyInjection() async {
  // SPHelper needs async initialization, so we'll handle it differently
  final spHelper = await SPHelper.instance();

  // Core
  getIt
    ..registerLazySingleton<NetworkManager>(() => NetworkManager.instance())
    ..registerSingleton<SPHelper>(spHelper)
    // Data Sources
    ..registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImpl(networkManager: getIt()),
    )
    // Repositories
    ..registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(remoteDataSource: getIt()),
    )
    // Use Cases
    ..registerLazySingleton(() => GetCategoriesUseCase(getIt()))
    ..registerLazySingleton(() => GetQuestionsUseCase(getIt()))
    // BLoCs - Factory because they should be created per route/page
    ..registerFactory(
      () => HomeBloc(
        getCategoriesUseCase: getIt(),
        getQuestionsUseCase: getIt(),
      ),
    )
    ..registerFactory(() => PlantLandingBloc())
    ..registerFactory(() => OnboardingBloc());
}
