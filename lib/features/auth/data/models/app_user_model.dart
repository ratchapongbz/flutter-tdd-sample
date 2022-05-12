import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'app_user_model.g.dart';

@JsonSerializable()
class AppUserModel extends Equatable {
  @JsonKey(defaultValue: '')
  final String id;

  @JsonKey(defaultValue: '')
  final String name;

  @JsonKey(name: 'area_id', defaultValue: '')
  final String areaId;

  const AppUserModel({
    required this.id,
    required this.name,
    required this.areaId,
  });

  factory AppUserModel.fromJson(Map<String, dynamic> json) => _$AppUserModelFromJson(json);

  Map<String, dynamic> toJson() => _$AppUserModelToJson(this);

  @override
  List<Object?> get props => [id, name, areaId];
}
