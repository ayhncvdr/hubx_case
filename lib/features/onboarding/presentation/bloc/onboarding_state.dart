import 'package:equatable/equatable.dart';

class OnboardingState extends Equatable {
  const OnboardingState({
    this.currentPage = 0,
    this.completed = false,
  });

  final int currentPage;
  final bool completed;

  OnboardingState copyWith({
    int? currentPage,
    bool? completed,
  }) {
    return OnboardingState(
      currentPage: currentPage ?? this.currentPage,
      completed: completed ?? this.completed,
    );
  }

  @override
  List<Object?> get props => [currentPage, completed];
}
