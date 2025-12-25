import 'package:hubx_case/core/errors/failure.dart';
import 'package:hubx_case/core/errors/network_exception_handler.dart';
import 'package:hubx_case/core/network/network_manager.dart';
import 'package:hubx_case/features/home/data/models/categories_model.dart';
import 'package:hubx_case/features/home/data/models/question_model.dart';
import 'package:hubx_case/shared/utils/api_endpoints.dart';

abstract class HomeRemoteDataSource {
  Future<CategoriesModel> getCategories();
  Future<List<QuestionModel>> getQuestions();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  HomeRemoteDataSourceImpl({required NetworkManager networkManager}) : _networkManager = networkManager;

  final NetworkManager _networkManager;

  @override
  Future<CategoriesModel> getCategories() async {
    try {
      final response = await _networkManager.getJson(ApiEndpoints.getCategories);
      if (response is! Map<String, dynamic>) {
        throw const ServerFailure('Invalid response format: expected Map');
      }
      return CategoriesModel.fromJson(response);
    } catch (e) {
      if (e is Failure) {
        rethrow;
      }
      throw NetworkExceptionHandler.handleException(e);
    }
  }

  @override
  Future<List<QuestionModel>> getQuestions() async {
    try {
      final response = await _networkManager.getJson(ApiEndpoints.getQuestions);

      List<dynamic> questionsList;
      if (response is List) {
        questionsList = response;
      } else if (response is Map<String, dynamic> && response['data'] is List) {
        questionsList = response['data'] as List;
      } else {
        throw const ServerFailure('Invalid response format: expected List or Map with data field');
      }

      return questionsList.map((json) {
        if (json is! Map<String, dynamic>) {
          throw ServerFailure('Invalid question format: expected Map<String, dynamic>, got ${json.runtimeType}');
        }
        return QuestionModel.fromJson(json);
      }).toList();
    } catch (e) {
      if (e is Failure) {
        rethrow;
      }
      throw NetworkExceptionHandler.handleException(e);
    }
  }
}
