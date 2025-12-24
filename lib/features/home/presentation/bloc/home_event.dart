part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable{
  const HomeEvent();

  List<Object?> get props => [];
}

class HomeEventLoadData extends HomeEvent {
  const HomeEventLoadData();
}
