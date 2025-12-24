import 'package:json_annotation/json_annotation.dart';

part 'question_model.g.dart';

@JsonSerializable()
class QuestionModel {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'subtitle')
  final String? subtitle;
  @JsonKey(name: 'image_uri')
  final String? imageUri;
  @JsonKey(name: 'uri')
  final String? uri;
  @JsonKey(name: 'order')
  final int? order;

  QuestionModel({
    this.id,
    this.title,
    this.subtitle,
    this.imageUri,
    this.uri,
    this.order,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) => _$QuestionModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionModelToJson(this);
}
