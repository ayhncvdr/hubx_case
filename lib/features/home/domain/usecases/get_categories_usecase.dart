import 'package:hubx_case/features/home/domain/entities/category.dart';
import 'package:hubx_case/features/home/domain/repositories/home_repository.dart';

class GetCategoriesUseCase {
  GetCategoriesUseCase(this._repository);

  final HomeRepository _repository;

  Future<List<Category>> call() => _repository.getCategories();
}
