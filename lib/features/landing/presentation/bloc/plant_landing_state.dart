part of 'plant_landing_bloc.dart';

class PlantLandingState {
  const PlantLandingState({this.currentIndex = 0});

  final int currentIndex;

  PlantLandingState copyWith({int? currentIndex}) {
    return PlantLandingState(
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }

  List<Object?> get props => [currentIndex];
}
