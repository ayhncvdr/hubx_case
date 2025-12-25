import 'package:hubx_case/features/home/data/models/category_datum_model.dart';
import 'package:hubx_case/features/home/domain/entities/category.dart';
import 'package:hubx_case/features/home/domain/entities/category_image.dart';

class CategoryMapper {
  static Category toEntity(CategoryDatumModel model) {
    return Category(
      id: model.id,
      name: model.name,
      title: model.title,
      rank: model.rank,
      image: model.image != null ? CategoryImage(url: model.image!.url) : null,
    );
  }

  static List<Category> toEntityList(List<CategoryDatumModel> models) {
    return models.map((model) => toEntity(model)).toList();
  }
}
