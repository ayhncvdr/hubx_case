part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState({
    this.categories = const [],
    this.questions = const [],
    this.isLoading = false,
    this.error,
  });

  final List<Category> categories;
  final List<Question> questions;
  final bool isLoading;
  final String? error;

  HomeState copyWith({
    List<Category>? categories,
    List<Question>? questions,
    bool? isLoading,
    String? error,
  }) {
    return HomeState(
      categories: categories ?? this.categories,
      questions: questions ?? this.questions,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [categories, questions, isLoading, error];
}
