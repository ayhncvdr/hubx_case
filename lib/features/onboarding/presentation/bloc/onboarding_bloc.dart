import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hubx_case/core/storage/sp_helper.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc({required SPHelper spHelper})
      : _spHelper = spHelper,
        super(const OnboardingState()) {
    on<OnboardingEventLoadStatus>(_onLoadStatus);
    on<OnboardingEventChangePage>(_onPageChange);
    on<OnboardingEventClosePaywall>(_onClosePaywall);
    on<OnboardingEventSelectPlan>(_onSelectPlan);
  }

  final SPHelper _spHelper;

  Future<void> _onLoadStatus(
    OnboardingEventLoadStatus event,
    Emitter<OnboardingState> emit,
  ) async {
    try {
      final completed = _spHelper.get<bool>(SPKey.onboardingCompleted) ?? false;
      emit(state.copyWith(completed: completed));
    } catch (_) {
      emit(state.copyWith(completed: false));
    }
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
      await _spHelper.set<bool>(SPKey.onboardingCompleted, true);
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
