// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShowModel _$ShowModelFromJson(Map<String, dynamic> json) => ShowModel(
      id: json['id'] as int,
      url: json['url'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      language: json['language'] as String,
      genres:
          (json['genres'] as List<dynamic>).map((e) => e as String).toList(),
      status: json['status'] as String,
      runtime: json['runtime'] as int,
      averageRuntime: json['averageRuntime'] as int,
      premiered: DateTime.parse(json['premiered'] as String),
      ended: DateTime.parse(json['ended'] as String),
      officialSite: json['officialSite'] as String,
      rating: ShowRating.fromJson(json['rating'] as Map<String, dynamic>),
      weight: json['weight'] as int,
      network:
          ShowNetworkModel.fromJson(json['network'] as Map<String, dynamic>),
      image: ShowImageModel.fromJson(json['image'] as Map<String, dynamic>),
      summary: json['summary'] as String,
      updated: json['updated'] as int,
    );

Map<String, dynamic> _$ShowModelToJson(ShowModel instance) => <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'name': instance.name,
      'type': instance.type,
      'language': instance.language,
      'genres': instance.genres,
      'status': instance.status,
      'runtime': instance.runtime,
      'averageRuntime': instance.averageRuntime,
      'premiered': instance.premiered.toIso8601String(),
      'ended': instance.ended.toIso8601String(),
      'officialSite': instance.officialSite,
      'rating': instance.rating.toJson(),
      'weight': instance.weight,
      'network': instance.network.toJson(),
      'image': instance.image.toJson(),
      'summary': instance.summary,
      'updated': instance.updated,
    };

ShowRating _$ShowRatingFromJson(Map<String, dynamic> json) => ShowRating(
      average: (json['average'] as num).toDouble(),
    );

Map<String, dynamic> _$ShowRatingToJson(ShowRating instance) =>
    <String, dynamic>{
      'average': instance.average,
    };
