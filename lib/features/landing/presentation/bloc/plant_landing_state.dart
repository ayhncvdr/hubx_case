part of 'plant_landing_bloc.dart';

class PlantLandingState extends Equatable {
  const PlantLandingState({this.currentIndex = 0});

  final int currentIndex;

  PlantLandingState copyWith({int? currentIndex}) {
    return PlantLandingState(
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }

  @override
  List<Object?> get props => [currentIndex];
}
