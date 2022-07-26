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
      runtime: json['runtime'] as int?,
      averageRuntime: json['averageRuntime'] as int?,
      premiered: DateTime.parse(json['premiered'] as String),
      ended: json['ended'] == null
          ? null
          : DateTime.parse(json['ended'] as String),
      officialSite: json['officialSite'] as String?,
      rating: json['rating'] == null
          ? null
          : ShowRating.fromJson(json['rating'] as Map<String, dynamic>),
      weight: json['weight'] as int,
      network: json['network'] == null
          ? null
          : ShowNetworkModel.fromJson(json['network'] as Map<String, dynamic>),
      image: json['image'] == null
          ? null
          : ShowImageModel.fromJson(json['image'] as Map<String, dynamic>),
      summary: json['summary'] as String,
      updated: json['updated'] as int?,
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
      'ended': instance.ended?.toIso8601String(),
      'officialSite': instance.officialSite,
      'rating': instance.rating?.toJson(),
      'weight': instance.weight,
      'network': instance.network?.toJson(),
      'image': instance.image?.toJson(),
      'summary': instance.summary,
      'updated': instance.updated,
    };

ShowRating _$ShowRatingFromJson(Map<String, dynamic> json) => ShowRating(
      average: (json['average'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ShowRatingToJson(ShowRating instance) =>
    <String, dynamic>{
      'average': instance.average,
    };

ShowSchedule _$ShowScheduleFromJson(Map<String, dynamic> json) => ShowSchedule(
      time: json['time'] as String,
      days: (json['days'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ShowScheduleToJson(ShowSchedule instance) =>
    <String, dynamic>{
      'time': instance.time,
      'days': instance.days,
    };
