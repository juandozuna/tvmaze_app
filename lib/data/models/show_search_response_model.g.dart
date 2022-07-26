// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show_search_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShowSearchResponseModel _$ShowSearchResponseModelFromJson(
        Map<String, dynamic> json) =>
    ShowSearchResponseModel(
      score: (json['score'] as num).toDouble(),
      show: ShowModel.fromJson(json['show'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ShowSearchResponseModelToJson(
        ShowSearchResponseModel instance) =>
    <String, dynamic>{
      'score': instance.score,
      'show': instance.show.toJson(),
    };
