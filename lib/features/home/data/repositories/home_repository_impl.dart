import 'package:hubx_case/core/errors/failure.dart';
import 'package:hubx_case/features/home/data/datasources/home_remote_datasource.dart';
import 'package:hubx_case/features/home/data/mappers/category_mapper.dart';
import 'package:hubx_case/features/home/data/mappers/question_mapper.dart';
import 'package:hubx_case/features/home/domain/entities/category.dart';
import 'package:hubx_case/features/home/domain/entities/question.dart';
import 'package:hubx_case/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl({required HomeRemoteDataSource remoteDataSource}) : _remoteDataSource = remoteDataSource;

  final HomeRemoteDataSource _remoteDataSource;

  @override
  Future<List<Category>> getCategories() async {
    try {
      final categoriesModel = await _remoteDataSource.getCategories();
      return categoriesModel.data != null ? CategoryMapper.toEntityList(categoriesModel.data!) : [];
    } catch (e) {
      if (e is Failure) {
        rethrow;
      }
      throw UnknownFailure('Failed to get categories: $e');
    }
  }

  @override
  Future<List<Question>> getQuestions() async {
    try {
      final questions = await _remoteDataSource.getQuestions();
      return QuestionMapper.toEntityList(questions);
    } catch (e) {
      if (e is Failure) {
        rethrow;
      }
      throw UnknownFailure('Failed to get questions: $e');
    }
  }
}
