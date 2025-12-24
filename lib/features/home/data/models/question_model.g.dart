// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionModel _$QuestionModelFromJson(Map<String, dynamic> json) => QuestionModel(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      subtitle: json['subtitle'] as String?,
      imageUri: json['image_uri'] as String?,
      uri: json['uri'] as String?,
      order: (json['order'] as num?)?.toInt(),
    );

Map<String, dynamic> _$QuestionModelToJson(QuestionModel instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'image_uri': instance.imageUri,
      'uri': instance.uri,
      'order': instance.order,
    };
