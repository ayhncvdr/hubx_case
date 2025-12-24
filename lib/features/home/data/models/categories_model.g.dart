// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoriesModel _$CategoriesModelFromJson(Map<String, dynamic> json) => CategoriesModel(
      data:
          (json['data'] as List<dynamic>?)?.map((e) => CategoryDatumModel.fromJson(e as Map<String, dynamic>)).toList(),
    );

Map<String, dynamic> _$CategoriesModelToJson(CategoriesModel instance) => <String, dynamic>{
      'data': instance.data,
    };
