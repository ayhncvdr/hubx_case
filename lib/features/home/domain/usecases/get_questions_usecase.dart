import 'package:hubx_case/features/home/domain/entities/question.dart';
import 'package:hubx_case/features/home/domain/repositories/home_repository.dart';

class GetQuestionsUseCase {
  GetQuestionsUseCase(this._repository);

  final HomeRepository _repository;

  Future<List<Question>> call() => _repository.getQuestions();
}
