import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hubx_case/core/errors/failure.dart';
import 'package:hubx_case/features/home/domain/entities/category.dart';
import 'package:hubx_case/features/home/domain/entities/question.dart';
import 'package:hubx_case/features/home/domain/usecases/get_categories_usecase.dart';
import 'package:hubx_case/features/home/domain/usecases/get_questions_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required GetCategoriesUseCase getCategoriesUseCase,
    required GetQuestionsUseCase getQuestionsUseCase,
  })  : _getCategoriesUseCase = getCategoriesUseCase,
        _getQuestionsUseCase = getQuestionsUseCase,
        super(const HomeState()) {
    on<HomeEventLoadData>(_onLoadData);
  }

  final GetCategoriesUseCase _getCategoriesUseCase;
  final GetQuestionsUseCase _getQuestionsUseCase;

  Future<void> _onLoadData(
    HomeEventLoadData event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    try {
      final categories = await _getCategoriesUseCase();
      final questions = await _getQuestionsUseCase();

      emit(
        state.copyWith(
          categories: categories,
          questions: questions,
          isLoading: false,
        ),
      );
    } catch (e) {
      final failure = e is Failure ? e : UnknownFailure(e.toString());
      emit(
        state.copyWith(
          isLoading: false,
          failure: failure,
        ),
      );
    }
  }
}
