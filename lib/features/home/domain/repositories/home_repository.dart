import 'package:hubx_case/features/home/domain/entities/category.dart';
import 'package:hubx_case/features/home/domain/entities/question.dart';

abstract class HomeRepository {
  Future<List<Category>> getCategories();
  Future<List<Question>> getQuestions();
}
