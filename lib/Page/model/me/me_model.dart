// Generated by https://quicktype.io
//
// To change quicktype's target language, run command:
//
//   "Set quicktype target language"

import 'package:json_annotation/json_annotation.dart';

part 'me_model.g.dart';

@JsonSerializable()
class MeModel extends Object {
  List<MeItem> data = [];

  MeModel(
    this.data,
  );

  factory MeModel.fromJson(Map<String, dynamic> srcJson) =>
      _$MeModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MeModelToJson(this);
}

@JsonSerializable()
class MeItem extends Object {
  String id;

  String name;

  String url;
  // 0: 不显示 1：未关注 2：已关注 3：互相关注
  int state;

  MeItem(
    this.id,
    this.name,
    this.url,
    this.state,
  );

  factory MeItem.fromJson(Map<String, dynamic> srcJson) =>
      _$MeItemFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MeItemToJson(this);
}
