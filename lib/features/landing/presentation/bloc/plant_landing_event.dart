part of 'plant_landing_bloc.dart';

sealed class PlantLandingEvent {
  const PlantLandingEvent();

  List<Object?> get props => [];
}

class PlantLandingEventChangeTab extends PlantLandingEvent {
  const PlantLandingEventChangeTab(this.index);

  final int index;

  @override
  List<Object?> get props => [index];
}
