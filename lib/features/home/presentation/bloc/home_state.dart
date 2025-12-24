import 'package:equatable/equatable.dart';
import 'package:hubx_case/features/home/domain/entities/category.dart';
import 'package:hubx_case/features/home/domain/entities/question.dart';

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
      error: error,
    );
  }

  @override
  List<Object?> get props => [categories, questions, isLoading, error];
}
