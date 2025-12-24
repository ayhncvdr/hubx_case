import 'package:flutter_bloc/flutter_bloc.dart';

part 'plant_landing_event.dart';
part 'plant_landing_state.dart';

class PlantLandingBloc extends Bloc<PlantLandingEvent, PlantLandingState> {
  PlantLandingBloc() : super(const PlantLandingState()) {
    on<PlantLandingEventChangeTab>(_onTabChanged);
  }

  void _onTabChanged(
    PlantLandingEventChangeTab event,
    Emitter<PlantLandingState> emit,
  ) {
    emit(state.copyWith(currentIndex: event.index));
  }
}
