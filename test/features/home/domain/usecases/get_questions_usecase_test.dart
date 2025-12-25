import 'package:flutter_test/flutter_test.dart';
import 'package:hubx_case/core/errors/failure.dart';
import 'package:hubx_case/features/home/domain/entities/question.dart';
import 'package:hubx_case/features/home/domain/repositories/home_repository.dart';
import 'package:hubx_case/features/home/domain/usecases/get_questions_usecase.dart';
import 'package:mocktail/mocktail.dart';

class MockHomeRepository extends Mock implements HomeRepository {}

void main() {
  late GetQuestionsUseCase useCase;
  late MockHomeRepository mockRepository;

  setUp(() {
    mockRepository = MockHomeRepository();
    useCase = GetQuestionsUseCase(mockRepository);
  });

  group('GetQuestionsUseCase', () {
    final tQuestions = [
      Question(
        id: 1,
        title: 'Test Question',
        subtitle: 'Test Subtitle',
        uri: 'https://example.com',
        order: 1,
      ),
    ];

    test('should return questions from repository', () async {
      // arrange
      when(() => mockRepository.getQuestions()).thenAnswer((_) async => tQuestions);

      // act
      final result = await useCase();

      // assert
      expect(result, tQuestions);
      verify(() => mockRepository.getQuestions()).called(1);
    });

    test('should return empty list when repository returns empty list', () async {
      // arrange
      when(() => mockRepository.getQuestions()).thenAnswer((_) async => <Question>[]);

      // act
      final result = await useCase();

      // assert
      expect(result, isEmpty);
      verify(() => mockRepository.getQuestions()).called(1);
    });

    test('should throw Failure when repository throws Failure', () async {
      // arrange
      const failure = NetworkFailure();
      when(() => mockRepository.getQuestions()).thenThrow(failure);

      // act & assert
      expect(() => useCase(), throwsA(failure));
      verify(() => mockRepository.getQuestions()).called(1);
    });

    test('should propagate exception when repository throws exception', () async {
      // arrange
      when(() => mockRepository.getQuestions()).thenThrow(Exception('Error'));

      // act & assert
      expect(() => useCase(), throwsException);
      verify(() => mockRepository.getQuestions()).called(1);
    });
  });
}
