// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'me_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MeModel _$MeModelFromJson(Map<String, dynamic> json) => MeModel(
      (json['data'] as List<dynamic>)
          .map((e) => MeItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MeModelToJson(MeModel instance) => <String, dynamic>{
      'data': instance.data,
    };

MeItem _$MeItemFromJson(Map<String, dynamic> json) => MeItem(
      json['id'] as String,
      json['name'] as String,
      json['url'] as String,
      json['state'] as int,
    );

Map<String, dynamic> _$MeItemToJson(MeItem instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'url': instance.url,
      'state': instance.state,
    };
