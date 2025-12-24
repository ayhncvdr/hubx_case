// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_datum_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryDatumModel _$CategoryDatumModelFromJson(Map<String, dynamic> json) => CategoryDatumModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      title: json['title'] as String?,
      rank: (json['rank'] as num?)?.toInt(),
      image: json['image'] == null ? null : CategoryImageModel.fromJson(json['image'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CategoryDatumModelToJson(CategoryDatumModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'title': instance.title,
      'rank': instance.rank,
      'image': instance.image,
    };
