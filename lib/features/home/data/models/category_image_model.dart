import 'package:json_annotation/json_annotation.dart';

part 'category_image_model.g.dart';

@JsonSerializable()
class CategoryImageModel {
  @JsonKey(name: 'url')
  final String? url;

  CategoryImageModel({
    this.url,
  });

  factory CategoryImageModel.fromJson(Map<String, dynamic> json) => _$CategoryImageModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryImageModelToJson(this);
}
