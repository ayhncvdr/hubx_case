import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hubx_case/features/landing/presentation/bloc/plant_landing_bloc.dart';

void main() {
  late PlantLandingBloc plantLandingBloc;

  setUp(() {
    plantLandingBloc = PlantLandingBloc();
  });

  tearDown(() {
    plantLandingBloc.close();
  });

  group('PlantLandingBloc', () {
    test('initial state should be PlantLandingState with currentIndex 0', () {
      expect(plantLandingBloc.state, const PlantLandingState());
    });

    blocTest<PlantLandingBloc, PlantLandingState>(
      'emits [currentIndex: 1] when ChangeTab event is dispatched with index 1',
      build: () => plantLandingBloc,
      act: (bloc) => bloc.add(const PlantLandingEventChangeTab(1)),
      expect: () => [
        const PlantLandingState(currentIndex: 1),
      ],
    );

    blocTest<PlantLandingBloc, PlantLandingState>(
      'emits [currentIndex: 2] when ChangeTab event is dispatched with index 2',
      build: () => plantLandingBloc,
      act: (bloc) => bloc.add(const PlantLandingEventChangeTab(2)),
      expect: () => [
        const PlantLandingState(currentIndex: 2),
      ],
    );

    blocTest<PlantLandingBloc, PlantLandingState>(
      'emits [currentIndex: 0] when ChangeTab event is dispatched with index 0',
      build: () => plantLandingBloc,
      seed: () => const PlantLandingState(currentIndex: 2),
      act: (bloc) => bloc.add(const PlantLandingEventChangeTab(0)),
      expect: () => [
        const PlantLandingState(),
      ],
    );

    blocTest<PlantLandingBloc, PlantLandingState>(
      'emits [currentIndex: 3] when ChangeTab event is dispatched with index 3',
      build: () => plantLandingBloc,
      act: (bloc) => bloc.add(const PlantLandingEventChangeTab(3)),
      expect: () => [
        const PlantLandingState(currentIndex: 3),
      ],
    );

    blocTest<PlantLandingBloc, PlantLandingState>(
      'handles multiple tab changes correctly',
      build: () => plantLandingBloc,
      act: (bloc) {
        bloc..add(const PlantLandingEventChangeTab(1))
        ..add(const PlantLandingEventChangeTab(2))
        ..add(const PlantLandingEventChangeTab(0));
      },
      expect: () => [
        const PlantLandingState(currentIndex: 1),
        const PlantLandingState(currentIndex: 2),
        const PlantLandingState(),
      ],
    );
  });
}
