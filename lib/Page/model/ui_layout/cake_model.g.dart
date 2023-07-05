// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cake_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CakeList _$CakeListFromJson(Map<String, dynamic> json) => CakeList(
      data: (json['data'] as List<dynamic>)
          .map((e) => CakeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CakeListToJson(CakeList instance) => <String, dynamic>{
      'data': instance.data,
    };

CakeModel _$CakeModelFromJson(Map<String, dynamic> json) => CakeModel(
      name: json['name'] as String,
      des: json['des'] as String,
      reviews: json['reviews'] as int,
      image: json['image'] as String,
    );

Map<String, dynamic> _$CakeModelToJson(CakeModel instance) => <String, dynamic>{
      'name': instance.name,
      'des': instance.des,
      'reviews': instance.reviews,
      'image': instance.image,
    };
