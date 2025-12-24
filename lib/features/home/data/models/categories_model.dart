import 'package:hubx_case/features/home/data/models/category_datum_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'categories_model.g.dart';

@JsonSerializable()
class CategoriesModel {
  @JsonKey(name: 'data')
  final List<CategoryDatumModel>? data;

  CategoriesModel({
    this.data,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) => _$CategoriesModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriesModelToJson(this);
}
