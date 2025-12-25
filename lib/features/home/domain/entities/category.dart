import 'package:hubx_case/features/home/domain/entities/category_image.dart';

class Category {
  final int? id;
  final String? name;
  final String? title;
  final int? rank;
  final CategoryImage? image;

  Category({
    this.id,
    this.name,
    this.title,
    this.rank,
    this.image,
  });
}
