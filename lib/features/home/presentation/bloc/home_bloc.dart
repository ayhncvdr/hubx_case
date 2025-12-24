import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hubx_case/features/home/domain/usecases/get_categories_usecase.dart';
import 'package:hubx_case/features/home/domain/usecases/get_questions_usecase.dart';
import 'package:hubx_case/features/home/presentation/bloc/home_event.dart';
import 'package:hubx_case/features/home/presentation/bloc/home_state.dart';

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
      emit(
        state.copyWith(
          isLoading: false,
          error: e.toString(),
        ),
      );
    }
  }
}
