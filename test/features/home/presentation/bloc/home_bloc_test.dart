import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hubx_case/core/errors/failure.dart';
import 'package:hubx_case/features/home/domain/entities/category.dart';
import 'package:hubx_case/features/home/domain/entities/question.dart';
import 'package:hubx_case/features/home/domain/usecases/get_categories_usecase.dart';
import 'package:hubx_case/features/home/domain/usecases/get_questions_usecase.dart';
import 'package:hubx_case/features/home/presentation/bloc/home_bloc.dart';
import 'package:mocktail/mocktail.dart';

class MockGetCategoriesUseCase extends Mock implements GetCategoriesUseCase {}

class MockGetQuestionsUseCase extends Mock implements GetQuestionsUseCase {}

void main() {
  late HomeBloc homeBloc;
  late MockGetCategoriesUseCase mockGetCategoriesUseCase;
  late MockGetQuestionsUseCase mockGetQuestionsUseCase;

  setUp(() {
    mockGetCategoriesUseCase = MockGetCategoriesUseCase();
    mockGetQuestionsUseCase = MockGetQuestionsUseCase();
    homeBloc = HomeBloc(
      getCategoriesUseCase: mockGetCategoriesUseCase,
      getQuestionsUseCase: mockGetQuestionsUseCase,
    );
  });

  tearDown(() {
    homeBloc.close();
  });

  group('HomeBloc', () {
    final tCategories = [
      Category(
        id: 1,
        title: 'Test Category',
        name: 'test_category',
      ),
    ];

    final tQuestions = [
      Question(
        id: 1,
        title: 'Test Question',
        subtitle: 'Test Subtitle',
        uri: 'https://example.com',
      ),
    ];

    test('initial state should be HomeState with empty data', () {
      expect(homeBloc.state, const HomeState());
    });

    blocTest<HomeBloc, HomeState>(
      'emits [loading, success] when data is loaded successfully',
      build: () {
        when(() => mockGetCategoriesUseCase()).thenAnswer((_) async => tCategories);
        when(() => mockGetQuestionsUseCase()).thenAnswer((_) async => tQuestions);
        return homeBloc;
      },
      act: (bloc) => bloc.add(const HomeEventLoadData()),
      expect: () => [
        const HomeState(isLoading: true),
        HomeState(
          categories: tCategories,
          questions: tQuestions,
        ),
      ],
      verify: (_) {
        verify(() => mockGetCategoriesUseCase()).called(1);
        verify(() => mockGetQuestionsUseCase()).called(1);
      },
    );

    blocTest<HomeBloc, HomeState>(
      'emits [loading, error] when getCategories fails',
      build: () {
        when(() => mockGetCategoriesUseCase()).thenThrow(const NetworkFailure());
        when(() => mockGetQuestionsUseCase()).thenAnswer((_) async => tQuestions);
        return homeBloc;
      },
      act: (bloc) => bloc.add(const HomeEventLoadData()),
      expect: () => [
        const HomeState(isLoading: true),
        const HomeState(
          failure: NetworkFailure(),
        ),
      ],
      verify: (_) {
        verify(() => mockGetCategoriesUseCase()).called(1);
        verifyNever(() => mockGetQuestionsUseCase());
      },
    );

    blocTest<HomeBloc, HomeState>(
      'emits [loading, error] when getQuestions fails',
      build: () {
        when(() => mockGetCategoriesUseCase()).thenAnswer((_) async => tCategories);
        when(() => mockGetQuestionsUseCase()).thenThrow(const NetworkFailure());
        return homeBloc;
      },
      act: (bloc) => bloc.add(const HomeEventLoadData()),
      expect: () => [
        const HomeState(isLoading: true),
        const HomeState(
          failure: NetworkFailure(),
        ),
      ],
      verify: (_) {
        verify(() => mockGetCategoriesUseCase()).called(1);
        verify(() => mockGetQuestionsUseCase()).called(1);
      },
    );

    blocTest<HomeBloc, HomeState>(
      'emits [loading, error] when both use cases fail',
      build: () {
        when(() => mockGetCategoriesUseCase()).thenThrow(const NetworkFailure('Categories error'));
        when(() => mockGetQuestionsUseCase()).thenThrow(const NetworkFailure('Questions error'));
        return homeBloc;
      },
      act: (bloc) => bloc.add(const HomeEventLoadData()),
      expect: () => [
        const HomeState(isLoading: true),
        const HomeState(
          failure: NetworkFailure('Categories error'),
        ),
      ],
      verify: (_) {
        verify(() => mockGetCategoriesUseCase()).called(1);
        verifyNever(() => mockGetQuestionsUseCase());
      },
    );

    blocTest<HomeBloc, HomeState>(
      'emits [loading, error] when unknown exception occurs',
      build: () {
        when(() => mockGetCategoriesUseCase()).thenThrow(Exception('Unknown error'));
        when(() => mockGetQuestionsUseCase()).thenAnswer((_) async => tQuestions);
        return homeBloc;
      },
      act: (bloc) => bloc.add(const HomeEventLoadData()),
      expect: () => [
        const HomeState(isLoading: true),
        predicate<HomeState>(
          (state) => !state.isLoading && state.failure is UnknownFailure,
        ),
      ],
    );

    blocTest<HomeBloc, HomeState>(
      'clears failure when loading starts',
      build: () {
        when(() => mockGetCategoriesUseCase()).thenAnswer((_) async => tCategories);
        when(() => mockGetQuestionsUseCase()).thenAnswer((_) async => tQuestions);
        return homeBloc;
      },
      seed: () => const HomeState(
        failure: NetworkFailure('Previous error'),
      ),
      act: (bloc) => bloc.add(const HomeEventLoadData()),
      expect: () => [
        const HomeState(isLoading: true),
        HomeState(
          categories: tCategories,
          questions: tQuestions,
        ),
      ],
    );
  });
}
