part of 'plant_landing_bloc.dart';

sealed class PlantLandingEvent extends Equatable {
  const PlantLandingEvent();

  @override
  List<Object?> get props => [];
}

class PlantLandingEventChangeTab extends PlantLandingEvent {
  const PlantLandingEventChangeTab(this.index);

  final int index;

  @override
  List<Object?> get props => [index];
}
