import 'package:equatable/equatable.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class HomeEventLoadData extends HomeEvent {
  const HomeEventLoadData();
}
