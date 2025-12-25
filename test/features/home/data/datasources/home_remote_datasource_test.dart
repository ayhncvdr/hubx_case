import 'package:flutter_test/flutter_test.dart';
import 'package:hubx_case/core/errors/failure.dart';
import 'package:hubx_case/core/network/network_manager.dart';
import 'package:hubx_case/features/home/data/datasources/home_remote_datasource.dart';
import 'package:hubx_case/features/home/data/models/categories_model.dart';
import 'package:hubx_case/features/home/data/models/question_model.dart';
import 'package:hubx_case/shared/utils/api_endpoints.dart';
import 'package:mocktail/mocktail.dart';

class MockNetworkManager extends Mock implements NetworkManager {}

void main() {
  late HomeRemoteDataSourceImpl dataSource;
  late MockNetworkManager mockNetworkManager;

  setUp(() {
    mockNetworkManager = MockNetworkManager();
    dataSource = HomeRemoteDataSourceImpl(networkManager: mockNetworkManager);
  });

  group('getCategories', () {
    final tCategoriesJson = {
      'data': [
        {
          'id': 1,
          'name': 'test_category',
          'title': 'Test Category',
          'rank': 1,
        },
      ],
    };

    test('should return CategoriesModel when network call succeeds', () async {
      // arrange
      when(() => mockNetworkManager.getJson(ApiEndpoints.getCategories)).thenAnswer((_) async => tCategoriesJson);

      // act
      final result = await dataSource.getCategories();

      // assert
      expect(result, isA<CategoriesModel>());
      expect(result.data, isNotNull);
      expect(result.data!.length, 1);
      verify(() => mockNetworkManager.getJson(ApiEndpoints.getCategories)).called(1);
    });

    test('should throw ServerFailure when response is not a Map', () async {
      // arrange
      when(() => mockNetworkManager.getJson(ApiEndpoints.getCategories)).thenAnswer((_) async => []);

      // act & assert
      expect(
        () => dataSource.getCategories(),
        throwsA(isA<ServerFailure>()),
      );
      verify(() => mockNetworkManager.getJson(ApiEndpoints.getCategories)).called(1);
    });

    test('should throw UnknownFailure when network call throws generic Exception', () async {
      // arrange
      when(() => mockNetworkManager.getJson(ApiEndpoints.getCategories)).thenThrow(Exception('Network error'));

      // act & assert
      expect(
        () => dataSource.getCategories(),
        throwsA(isA<UnknownFailure>()),
      );
      verify(() => mockNetworkManager.getJson(ApiEndpoints.getCategories)).called(1);
    });

    test('should rethrow Failure when network call throws Failure', () async {
      // arrange
      const failure = ServerFailure();
      when(() => mockNetworkManager.getJson(ApiEndpoints.getCategories)).thenThrow(failure);

      // act & assert
      expect(() => dataSource.getCategories(), throwsA(failure));
      verify(() => mockNetworkManager.getJson(ApiEndpoints.getCategories)).called(1);
    });
  });

  group('getQuestions', () {
    final tQuestionsJsonList = [
      {
        'id': 1,
        'title': 'Test Question',
        'subtitle': 'Test Subtitle',
        'image_uri': 'https://example.com/image.jpg',
        'uri': 'https://example.com',
        'order': 1,
      },
    ];

    final tQuestionsJsonMap = {
      'data': tQuestionsJsonList,
    };

    test('should return List<QuestionModel> when response is a List', () async {
      // arrange
      when(() => mockNetworkManager.getJson(ApiEndpoints.getQuestions)).thenAnswer((_) async => tQuestionsJsonList);

      // act
      final result = await dataSource.getQuestions();

      // assert
      expect(result, isA<List<QuestionModel>>());
      expect(result.length, 1);
      expect(result[0].id, 1);
      expect(result[0].title, 'Test Question');
      verify(() => mockNetworkManager.getJson(ApiEndpoints.getQuestions)).called(1);
    });

    test('should return List<QuestionModel> when response is a Map with data field', () async {
      // arrange
      when(() => mockNetworkManager.getJson(ApiEndpoints.getQuestions)).thenAnswer((_) async => tQuestionsJsonMap);

      // act
      final result = await dataSource.getQuestions();

      // assert
      expect(result, isA<List<QuestionModel>>());
      expect(result.length, 1);
      expect(result[0].id, 1);
      expect(result[0].title, 'Test Question');
      verify(() => mockNetworkManager.getJson(ApiEndpoints.getQuestions)).called(1);
    });

    test('should throw ServerFailure when response format is invalid', () async {
      // arrange
      when(() => mockNetworkManager.getJson(ApiEndpoints.getQuestions)).thenAnswer((_) async => 'invalid');

      // act & assert
      expect(
        () => dataSource.getQuestions(),
        throwsA(isA<ServerFailure>()),
      );
      verify(() => mockNetworkManager.getJson(ApiEndpoints.getQuestions)).called(1);
    });

    test('should throw ServerFailure when question item is not a Map', () async {
      // arrange
      when(() => mockNetworkManager.getJson(ApiEndpoints.getQuestions)).thenAnswer((_) async => ['not a map']);

      // act & assert
      expect(
        () => dataSource.getQuestions(),
        throwsA(isA<ServerFailure>()),
      );
      verify(() => mockNetworkManager.getJson(ApiEndpoints.getQuestions)).called(1);
    });

    test('should throw UnknownFailure when network call throws generic Exception', () async {
      // arrange
      when(() => mockNetworkManager.getJson(ApiEndpoints.getQuestions)).thenThrow(Exception('Network error'));

      // act & assert
      expect(
        () => dataSource.getQuestions(),
        throwsA(isA<UnknownFailure>()),
      );
      verify(() => mockNetworkManager.getJson(ApiEndpoints.getQuestions)).called(1);
    });

    test('should rethrow Failure when network call throws Failure', () async {
      // arrange
      const failure = ServerFailure();
      when(() => mockNetworkManager.getJson(ApiEndpoints.getQuestions)).thenThrow(failure);

      // act & assert
      expect(() => dataSource.getQuestions(), throwsA(failure));
      verify(() => mockNetworkManager.getJson(ApiEndpoints.getQuestions)).called(1);
    });

    test('should return empty list when response is empty list', () async {
      // arrange
      when(() => mockNetworkManager.getJson(ApiEndpoints.getQuestions)).thenAnswer((_) async => <dynamic>[]);

      // act
      final result = await dataSource.getQuestions();

      // assert
      expect(result, isEmpty);
      verify(() => mockNetworkManager.getJson(ApiEndpoints.getQuestions)).called(1);
    });
  });
}
