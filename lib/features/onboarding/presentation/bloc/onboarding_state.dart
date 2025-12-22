import 'package:equatable/equatable.dart';

class OnboardingState extends Equatable {
  const OnboardingState({this.completed = false});

  final bool completed;

  OnboardingState copyWith({bool? completed}) {
    return OnboardingState(
      completed: completed ?? this.completed,
    );
  }

  @override
  List<Object?> get props => [completed];
}
