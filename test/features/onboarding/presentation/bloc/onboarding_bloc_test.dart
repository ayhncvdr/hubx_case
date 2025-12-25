import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hubx_case/core/storage/sp_helper.dart';
import 'package:hubx_case/features/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:mocktail/mocktail.dart';

class MockSPHelper extends Mock implements SPHelper {}

void main() {
  late OnboardingBloc onboardingBloc;
  late MockSPHelper mockSPHelper;

  setUp(() {
    mockSPHelper = MockSPHelper();
    onboardingBloc = OnboardingBloc(spHelper: mockSPHelper);
  });

  tearDown(() {
    onboardingBloc.close();
  });

  group('OnboardingBloc', () {
    test('initial state should be OnboardingState with default values', () {
      expect(
        onboardingBloc.state,
        const OnboardingState(
          
        ),
      );
    });

    blocTest<OnboardingBloc, OnboardingState>(
      'emits [completed: true] when LoadStatus succeeds and onboarding is completed',
      build: () {
        when(() => mockSPHelper.get<bool>(SPKey.onboardingCompleted)).thenReturn(true);
        return onboardingBloc;
      },
      act: (bloc) => bloc.add(const OnboardingEventLoadStatus()),
      expect: () => [
        const OnboardingState(completed: true),
      ],
      verify: (_) {
        verify(() => mockSPHelper.get<bool>(SPKey.onboardingCompleted)).called(1);
      },
    );

    blocTest<OnboardingBloc, OnboardingState>(
      'emits [completed: false] when LoadStatus succeeds and onboarding is not completed',
      build: () {
        when(() => mockSPHelper.get<bool>(SPKey.onboardingCompleted)).thenReturn(false);
        return onboardingBloc;
      },
      act: (bloc) => bloc.add(const OnboardingEventLoadStatus()),
      expect: () => [
        const OnboardingState(),
      ],
      verify: (_) {
        verify(() => mockSPHelper.get<bool>(SPKey.onboardingCompleted)).called(1);
      },
    );

    blocTest<OnboardingBloc, OnboardingState>(
      'emits [completed: false] when LoadStatus fails',
      build: () {
        when(() => mockSPHelper.get<bool>(SPKey.onboardingCompleted)).thenThrow(Exception('Error'));
        return onboardingBloc;
      },
      act: (bloc) => bloc.add(const OnboardingEventLoadStatus()),
      expect: () => [
        const OnboardingState(),
      ],
      verify: (_) {
        verify(() => mockSPHelper.get<bool>(SPKey.onboardingCompleted)).called(1);
      },
    );

    blocTest<OnboardingBloc, OnboardingState>(
      'emits [currentPage: 1] when ChangePage event is dispatched',
      build: () => onboardingBloc,
      act: (bloc) => bloc.add(const OnboardingEventChangePage(1)),
      expect: () => [
        const OnboardingState(currentPage: 1),
      ],
    );

    blocTest<OnboardingBloc, OnboardingState>(
      'emits [currentPage: 2] when ChangePage event is dispatched with page 2',
      build: () => onboardingBloc,
      act: (bloc) => bloc.add(const OnboardingEventChangePage(2)),
      expect: () => [
        const OnboardingState(currentPage: 2),
      ],
    );

    blocTest<OnboardingBloc, OnboardingState>(
      'emits [selectedPlanIndex: 0] when SelectPlan event is dispatched with index 0',
      build: () => onboardingBloc,
      act: (bloc) => bloc.add(const OnboardingEventSelectPlan(0)),
      expect: () => [
        const OnboardingState(selectedPlanIndex: 0),
      ],
    );

    blocTest<OnboardingBloc, OnboardingState>(
      'emits [selectedPlanIndex: 1] when SelectPlan event is dispatched with index 1',
      build: () => onboardingBloc,
      act: (bloc) => bloc.add(const OnboardingEventSelectPlan(1)),
      expect: () => [
        const OnboardingState(),
      ],
    );

    blocTest<OnboardingBloc, OnboardingState>(
      'emits [completed: true] when ClosePaywall succeeds',
      build: () {
        when(() => mockSPHelper.set<bool>(SPKey.onboardingCompleted, true)).thenAnswer((_) async => true);
        return onboardingBloc;
      },
      act: (bloc) => bloc.add(const OnboardingEventClosePaywall()),
      expect: () => [
        const OnboardingState(completed: true),
      ],
      verify: (_) {
        verify(() => mockSPHelper.set<bool>(SPKey.onboardingCompleted, true)).called(1);
      },
    );

    blocTest<OnboardingBloc, OnboardingState>(
      'emits [completed: false] when ClosePaywall fails',
      build: () {
        when(() => mockSPHelper.set<bool>(SPKey.onboardingCompleted, true)).thenThrow(Exception('Error'));
        return onboardingBloc;
      },
      act: (bloc) => bloc.add(const OnboardingEventClosePaywall()),
      expect: () => [
        const OnboardingState(),
      ],
      verify: (_) {
        verify(() => mockSPHelper.set<bool>(SPKey.onboardingCompleted, true)).called(1);
      },
    );
  });
}
