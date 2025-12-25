import 'package:flutter_test/flutter_test.dart';
import 'package:hubx_case/core/errors/failure.dart';
import 'package:hubx_case/features/home/data/datasources/home_remote_datasource.dart';
import 'package:hubx_case/features/home/data/models/categories_model.dart';
import 'package:hubx_case/features/home/data/models/category_datum_model.dart';
import 'package:hubx_case/features/home/data/models/question_model.dart';
import 'package:hubx_case/features/home/data/repositories/home_repository_impl.dart';
import 'package:hubx_case/features/home/domain/entities/category.dart';
import 'package:hubx_case/features/home/domain/entities/question.dart';
import 'package:mocktail/mocktail.dart';

class MockHomeRemoteDataSource extends Mock implements HomeRemoteDataSource {}

void main() {
  late HomeRepositoryImpl repository;
  late MockHomeRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockHomeRemoteDataSource();
    repository = HomeRepositoryImpl(remoteDataSource: mockRemoteDataSource);
  });

  group('getCategories', () {
    final tCategoriesModel = CategoriesModel(
      data: [
        CategoryDatumModel(
          id: 1,
          name: 'test_category',
          title: 'Test Category',
          rank: 1,
        ),
      ],
    );

    final tCategories = [
      Category(
        id: 1,
        name: 'test_category',
        title: 'Test Category',
        rank: 1,
      ),
    ];

    test('should return categories when remote data source succeeds', () async {
      // arrange
      when(() => mockRemoteDataSource.getCategories()).thenAnswer((_) async => tCategoriesModel);

      // act
      final result = await repository.getCategories();

      // assert
      expect(result.length, tCategories.length);
      expect(result[0].id, tCategories[0].id);
      expect(result[0].title, tCategories[0].title);
      expect(result[0].name, tCategories[0].name);
      verify(() => mockRemoteDataSource.getCategories()).called(1);
    });

    test('should return empty list when data is null', () async {
      // arrange
      final emptyModel = CategoriesModel();
      when(() => mockRemoteDataSource.getCategories()).thenAnswer((_) async => emptyModel);

      // act
      final result = await repository.getCategories();

      // assert
      expect(result, isEmpty);
      verify(() => mockRemoteDataSource.getCategories()).called(1);
    });

    test('should throw NetworkFailure when remote data source throws NetworkFailure', () async {
      // arrange
      const failure = NetworkFailure();
      when(() => mockRemoteDataSource.getCategories()).thenThrow(failure);

      // act & assert
      expect(() => repository.getCategories(), throwsA(failure));
      verify(() => mockRemoteDataSource.getCategories()).called(1);
    });

    test('should throw UnknownFailure when remote data source throws unknown exception', () async {
      // arrange
      when(() => mockRemoteDataSource.getCategories()).thenThrow(Exception('Unknown error'));

      // act & assert
      expect(
        () => repository.getCategories(),
        throwsA(isA<UnknownFailure>()),
      );
      verify(() => mockRemoteDataSource.getCategories()).called(1);
    });
  });

  group('getQuestions', () {
    final tQuestionsModel = [
      QuestionModel(
        id: 1,
        title: 'Test Question',
        subtitle: 'Test Subtitle',
        imageUri: 'https://example.com/image.jpg',
        uri: 'https://example.com',
        order: 1,
      ),
    ];

    final tQuestions = [
      Question(
        id: 1,
        title: 'Test Question',
        subtitle: 'Test Subtitle',
        imageUri: 'https://example.com/image.jpg',
        uri: 'https://example.com',
        order: 1,
      ),
    ];

    test('should return questions when remote data source succeeds', () async {
      // arrange
      when(() => mockRemoteDataSource.getQuestions()).thenAnswer((_) async => tQuestionsModel);

      // act
      final result = await repository.getQuestions();

      // assert
      expect(result.length, tQuestions.length);
      expect(result[0].id, tQuestions[0].id);
      expect(result[0].title, tQuestions[0].title);
      expect(result[0].subtitle, tQuestions[0].subtitle);
      expect(result[0].uri, tQuestions[0].uri);
      verify(() => mockRemoteDataSource.getQuestions()).called(1);
    });

    test('should return empty list when remote data source returns empty list', () async {
      // arrange
      when(() => mockRemoteDataSource.getQuestions()).thenAnswer((_) async => <QuestionModel>[]);

      // act
      final result = await repository.getQuestions();

      // assert
      expect(result, isEmpty);
      verify(() => mockRemoteDataSource.getQuestions()).called(1);
    });

    test('should throw NetworkFailure when remote data source throws NetworkFailure', () async {
      // arrange
      const failure = NetworkFailure();
      when(() => mockRemoteDataSource.getQuestions()).thenThrow(failure);

      // act & assert
      expect(() => repository.getQuestions(), throwsA(failure));
      verify(() => mockRemoteDataSource.getQuestions()).called(1);
    });

    test('should throw UnknownFailure when remote data source throws unknown exception', () async {
      // arrange
      when(() => mockRemoteDataSource.getQuestions()).thenThrow(Exception('Unknown error'));

      // act & assert
      expect(
        () => repository.getQuestions(),
        throwsA(isA<UnknownFailure>()),
      );
      verify(() => mockRemoteDataSource.getQuestions()).called(1);
    });
  });
}
