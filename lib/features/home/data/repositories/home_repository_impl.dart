import 'package:hubx_case/features/home/data/datasources/home_remote_datasource.dart';
import 'package:hubx_case/features/home/data/mappers/category_mapper.dart';
import 'package:hubx_case/features/home/data/mappers/question_mapper.dart';
import 'package:hubx_case/features/home/domain/entities/category.dart';
import 'package:hubx_case/features/home/domain/entities/question.dart';
import 'package:hubx_case/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl({HomeRemoteDataSource? remoteDataSource})
      : _remoteDataSource = remoteDataSource ?? HomeRemoteDataSourceImpl();

  final HomeRemoteDataSource _remoteDataSource;

  @override
  Future<List<Category>> getCategories() async {
    final categoriesModel = await _remoteDataSource.getCategories();
    return categoriesModel.data != null ? CategoryMapper.toEntityList(categoriesModel.data!) : [];
  }

  @override
  Future<List<Question>> getQuestions() async {
    final questions = await _remoteDataSource.getQuestions();
    return QuestionMapper.toEntityList(questions);
  }
}
