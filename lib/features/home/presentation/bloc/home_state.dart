part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState({
    this.categories = const [],
    this.questions = const [],
    this.isLoading = false,
    this.failure,
  });

  final List<Category> categories;
  final List<Question> questions;
  final bool isLoading;
  final Failure? failure;

  HomeState copyWith({
    List<Category>? categories,
    List<Question>? questions,
    bool? isLoading,
    Failure? failure,
  }) {
    return HomeState(
      categories: categories ?? this.categories,
      questions: questions ?? this.questions,
      isLoading: isLoading ?? this.isLoading,
      failure: failure ?? this.failure,
    );
  }

  @override
  List<Object?> get props => [categories, questions, isLoading, failure];
}
