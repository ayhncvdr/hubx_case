import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hubx_case/core/storage/sp_helper.dart';
import 'package:hubx_case/features/onboarding/presentation/bloc/onboarding_event.dart';
import 'package:hubx_case/features/onboarding/presentation/bloc/onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(const OnboardingState()) {
    on<OnboardingCompleted>(_onCompleted);
  }

  Future<void> _onCompleted(
    OnboardingCompleted event,
    Emitter<OnboardingState> emit,
  ) async {
    final sp = await SPHelper.instance();
    await sp.set<bool>(SPKey.onboardingCompleted, true);
    emit(state.copyWith(completed: true));
  }
}
