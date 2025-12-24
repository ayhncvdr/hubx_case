part of 'onboarding_bloc.dart';

sealed class OnboardingEvent extends Equatable {
  const OnboardingEvent();

  @override
  List<Object?> get props => [];
}

class OnboardingEventChangePage extends OnboardingEvent {
  const OnboardingEventChangePage(this.page);
  final int page;

  @override
  List<Object?> get props => [page];
}

class OnboardingEventClosePaywall extends OnboardingEvent {
  const OnboardingEventClosePaywall();
}

class OnboardingEventSelectPlan extends OnboardingEvent {
  const OnboardingEventSelectPlan(this.planIndex);
  final int planIndex;

  @override
  List<Object?> get props => [planIndex];
}
