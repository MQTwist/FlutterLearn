import 'package:json_annotation/json_annotation.dart';

part 'cake_model.g.dart';

@JsonSerializable()
class CakeList {
  List<CakeModel> data = [];
  CakeList({
    required this.data,
  });
  factory CakeList.fromJson(Map<String, dynamic> json) =>
      _$CakeListFromJson(json);

  Map<String, dynamic> toJson() => _$CakeListToJson(this);
}

@JsonSerializable()
class CakeModel {
  String name;
  String des;
  int reviews;
  String image;

  CakeModel({
    required this.name,
    required this.des,
    required this.reviews,
    required this.image,
  });

  factory CakeModel.fromJson(Map<String, dynamic> json) =>
      _$CakeModelFromJson(json);

  Map<String, dynamic> toJson() => _$CakeModelToJson(this);
}
