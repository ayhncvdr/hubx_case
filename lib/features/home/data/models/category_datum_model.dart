import 'package:hubx_case/features/home/data/models/category_image_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_datum_model.g.dart';

@JsonSerializable()
class CategoryDatumModel {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'rank')
  final int? rank;
  @JsonKey(name: 'image')
  final CategoryImageModel? image;

  CategoryDatumModel({
    this.id,
    this.name,
    this.title,
    this.rank,
    this.image,
  });

  factory CategoryDatumModel.fromJson(Map<String, dynamic> json) => _$CategoryDatumModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryDatumModelToJson(this);
}
