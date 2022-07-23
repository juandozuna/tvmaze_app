import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'show_network_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ShowNetworkModel extends Equatable {
  final int id;
  final String name;
  final ShowCountryModel country;
  final String officialSite;

  const ShowNetworkModel({
    required this.id,
    required this.name,
    required this.country,
    required this.officialSite,
  });

  factory ShowNetworkModel.fromJson(Map<String, dynamic> json) =>
      _$ShowNetworkModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShowNetworkModelToJson(this);

  @override
  List<Object?> get props => [
        id,
        name,
        country,
        officialSite,
      ];

  @override
  bool get stringify => true;
}

@JsonSerializable(explicitToJson: true)
class ShowCountryModel extends Equatable {
  final String name;
  final String code;
  final String timezone;

  const ShowCountryModel({
    required this.name,
    required this.code,
    required this.timezone,
  });

  factory ShowCountryModel.fromJson(Map<String, dynamic> json) =>
      _$ShowCountryModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShowCountryModelToJson(this);

  @override
  List<Object?> get props => [
        name,
        code,
        timezone,
      ];

  @override
  bool get stringify => true;
}
