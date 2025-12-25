import 'package:flutter_test/flutter_test.dart';
import 'package:hubx_case/core/errors/failure.dart';
import 'package:hubx_case/features/home/domain/entities/category.dart';
import 'package:hubx_case/features/home/domain/repositories/home_repository.dart';
import 'package:hubx_case/features/home/domain/usecases/get_categories_usecase.dart';
import 'package:mocktail/mocktail.dart';

class MockHomeRepository extends Mock implements HomeRepository {}

void main() {
  late GetCategoriesUseCase useCase;
  late MockHomeRepository mockRepository;

  setUp(() {
    mockRepository = MockHomeRepository();
    useCase = GetCategoriesUseCase(mockRepository);
  });

  group('GetCategoriesUseCase', () {
    final tCategories = [
      Category(
        id: 1,
        name: 'test_category',
        title: 'Test Category',
        rank: 1,
      ),
    ];

    test('should return categories from repository', () async {
      // arrange
      when(() => mockRepository.getCategories()).thenAnswer((_) async => tCategories);

      // act
      final result = await useCase();

      // assert
      expect(result, tCategories);
      verify(() => mockRepository.getCategories()).called(1);
    });

    test('should return empty list when repository returns empty list', () async {
      // arrange
      when(() => mockRepository.getCategories()).thenAnswer((_) async => <Category>[]);

      // act
      final result = await useCase();

      // assert
      expect(result, isEmpty);
      verify(() => mockRepository.getCategories()).called(1);
    });

    test('should throw Failure when repository throws Failure', () async {
      // arrange
      const failure = NetworkFailure();
      when(() => mockRepository.getCategories()).thenThrow(failure);

      // act & assert
      expect(() => useCase(), throwsA(failure));
      verify(() => mockRepository.getCategories()).called(1);
    });

    test('should propagate exception when repository throws exception', () async {
      // arrange
      when(() => mockRepository.getCategories()).thenThrow(Exception('Error'));

      // act & assert
      expect(() => useCase(), throwsException);
      verify(() => mockRepository.getCategories()).called(1);
    });
  });
}
