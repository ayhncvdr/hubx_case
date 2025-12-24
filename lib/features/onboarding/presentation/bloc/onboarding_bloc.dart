import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hubx_case/core/storage/sp_helper.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(const OnboardingState()) {
    on<OnboardingEventChangePage>(_onPageChange);
    on<OnboardingEventClosePaywall>(_onClosePaywall);
    on<OnboardingEventSelectPlan>(_onSelectPlan);
  }

  void _onPageChange(
    OnboardingEventChangePage event,
    Emitter<OnboardingState> emit,
  ) {
    emit(state.copyWith(currentPage: event.page));
  }

  Future<void> _onClosePaywall(
    OnboardingEventClosePaywall event,
    Emitter<OnboardingState> emit,
  ) async {
    try {
      final sp = await SPHelper.instance();
      await sp.set<bool>(SPKey.onboardingCompleted, true);
      emit(state.copyWith(completed: true));
    } catch (_) {
      emit(state.copyWith(completed: false));
    }
  }

  void _onSelectPlan(
    OnboardingEventSelectPlan event,
    Emitter<OnboardingState> emit,
  ) {
    emit(state.copyWith(selectedPlanIndex: event.planIndex));
  }
}
