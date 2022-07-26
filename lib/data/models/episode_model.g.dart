// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EpisodeModel _$EpisodeModelFromJson(Map<String, dynamic> json) => EpisodeModel(
      id: json['id'] as int,
      url: json['url'] as String,
      name: json['name'] as String,
      season: json['season'] as int,
      number: json['number'] as int,
      type: json['type'] as String?,
      airdate: json['airdate'] == null
          ? null
          : DateTime.parse(json['airdate'] as String),
      airtime: json['airtime'] as String?,
      airstamp: json['airstamp'] == null
          ? null
          : DateTime.parse(json['airstamp'] as String),
      runtime: json['runtime'] as int?,
      rating: json['rating'] == null
          ? null
          : EpisodeRating.fromJson(json['rating'] as Map<String, dynamic>),
      image: json['image'] == null
          ? null
          : EpisodeImage.fromJson(json['image'] as Map<String, dynamic>),
      summary: json['summary'] as String?,
      links: json['links'] == null
          ? null
          : EpisodeLinks.fromJson(json['links'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EpisodeModelToJson(EpisodeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'name': instance.name,
      'season': instance.season,
      'number': instance.number,
      'type': instance.type,
      'airdate': instance.airdate?.toIso8601String(),
      'airtime': instance.airtime,
      'airstamp': instance.airstamp?.toIso8601String(),
      'runtime': instance.runtime,
      'rating': instance.rating,
      'image': instance.image,
      'summary': instance.summary,
      'links': instance.links,
    };

EpisodeImage _$EpisodeImageFromJson(Map<String, dynamic> json) => EpisodeImage(
      medium: json['medium'] as String,
      original: json['original'] as String,
    );

Map<String, dynamic> _$EpisodeImageToJson(EpisodeImage instance) =>
    <String, dynamic>{
      'medium': instance.medium,
      'original': instance.original,
    };

EpisodeLinks _$EpisodeLinksFromJson(Map<String, dynamic> json) => EpisodeLinks(
      self: json['self'] == null
          ? null
          : EpisodeSelf.fromJson(json['self'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EpisodeLinksToJson(EpisodeLinks instance) =>
    <String, dynamic>{
      'self': instance.self,
    };

EpisodeSelf _$EpisodeSelfFromJson(Map<String, dynamic> json) => EpisodeSelf(
      href: json['href'] as String?,
    );

Map<String, dynamic> _$EpisodeSelfToJson(EpisodeSelf instance) =>
    <String, dynamic>{
      'href': instance.href,
    };

EpisodeRating _$EpisodeRatingFromJson(Map<String, dynamic> json) =>
    EpisodeRating(
      average: (json['average'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$EpisodeRatingToJson(EpisodeRating instance) =>
    <String, dynamic>{
      'average': instance.average,
    };
