import 'package:equatable/equatable.dart';

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

class OnboardingEventContinue extends OnboardingEvent {
  const OnboardingEventContinue();
}
