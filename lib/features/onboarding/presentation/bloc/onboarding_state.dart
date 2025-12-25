part of 'onboarding_bloc.dart';

class OnboardingState extends Equatable {
  const OnboardingState({
    this.currentPage = 0,
    this.completed = false,
    this.selectedPlanIndex = 1, // Default to "1 Year" plan
  });

  final int currentPage;
  final bool completed;
  final int selectedPlanIndex;

  OnboardingState copyWith({
    int? currentPage,
    bool? completed,
    int? selectedPlanIndex,
  }) {
    return OnboardingState(
      currentPage: currentPage ?? this.currentPage,
      completed: completed ?? this.completed,
      selectedPlanIndex: selectedPlanIndex ?? this.selectedPlanIndex,
    );
  }

  @override
  List<Object?> get props => [currentPage, completed, selectedPlanIndex];
}
