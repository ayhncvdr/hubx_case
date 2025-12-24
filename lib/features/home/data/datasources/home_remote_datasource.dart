import 'package:hubx_case/core/network/network_manager.dart';
import 'package:hubx_case/features/home/data/models/categories_model.dart';
import 'package:hubx_case/features/home/data/models/question_model.dart';
import 'package:hubx_case/shared/utils/api_endpoints.dart';

abstract class HomeRemoteDataSource {
  Future<CategoriesModel> getCategories();
  Future<List<QuestionModel>> getQuestions();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  HomeRemoteDataSourceImpl(this._networkManager);

  final NetworkManager _networkManager;

  @override
  Future<CategoriesModel> getCategories() async {
    try {
      final response = await _networkManager.getJson(ApiEndpoints.getCategories);
      if (response is! Map<String, dynamic>) {
        throw Exception('Invalid response format: expected Map');
      }
      return CategoriesModel.fromJson(response);
    } catch (e) {
      throw Exception('Failed to fetch categories: $e');
    }
  }

  @override
  Future<List<QuestionModel>> getQuestions() async {
    try {
      final response = await _networkManager.getJson(ApiEndpoints.getQuestions);

      // Handle both direct List response and wrapped in 'data' field
      List<dynamic> questionsList;
      if (response is List) {
        questionsList = response;
      } else if (response is Map<String, dynamic> && response['data'] is List) {
        questionsList = response['data'] as List;
      } else {
        throw Exception('Invalid response format: expected List or Map with data field');
      }

      return questionsList.map((json) => QuestionModel.fromJson(json as Map<String, dynamic>)).toList();
    } catch (e) {
      throw Exception('Failed to fetch questions: $e');
    }
  }
}
