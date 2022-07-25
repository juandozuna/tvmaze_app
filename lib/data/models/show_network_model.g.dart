// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show_network_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShowNetworkModel _$ShowNetworkModelFromJson(Map<String, dynamic> json) =>
    ShowNetworkModel(
      id: json['id'] as int,
      name: json['name'] as String?,
      country: json['country'] == null
          ? null
          : ShowCountryModel.fromJson(json['country'] as Map<String, dynamic>),
      officialSite: json['officialSite'] as String?,
    );

Map<String, dynamic> _$ShowNetworkModelToJson(ShowNetworkModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'country': instance.country?.toJson(),
      'officialSite': instance.officialSite,
    };

ShowCountryModel _$ShowCountryModelFromJson(Map<String, dynamic> json) =>
    ShowCountryModel(
      name: json['name'] as String,
      code: json['code'] as String,
      timezone: json['timezone'] as String,
    );

Map<String, dynamic> _$ShowCountryModelToJson(ShowCountryModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
      'timezone': instance.timezone,
    };
