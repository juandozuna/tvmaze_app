import 'package:equatable/equatable.dart';
import 'package:tvmaze_app/data/models/show_image_model.dart';
import 'package:tvmaze_app/data/models/show_network_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'show_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ShowModel extends Equatable {
  final int id;
  final String url;
  final String name;
  final String type;
  final String language;
  final List<String> genres;
  final String status;
  final int? runtime;
  final int? averageRuntime;
  final DateTime premiered;
  final DateTime? ended;
  final String? officialSite;
  final ShowRating? rating;
  final int weight;
  final ShowNetworkModel? network;
  final ShowImageModel? image;
  final ShowSchedule? schedule;
  final String summary;
  final int? updated;

  const ShowModel({
    required this.id,
    required this.url,
    required this.name,
    required this.type,
    required this.language,
    required this.genres,
    required this.status,
    required this.runtime,
    required this.averageRuntime,
    required this.premiered,
    required this.ended,
    required this.officialSite,
    required this.rating,
    required this.weight,
    required this.network,
    required this.image,
    required this.schedule,
    required this.summary,
    required this.updated,
  });

  factory ShowModel.fromJson(Map<String, dynamic> json) =>
      _$ShowModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShowModelToJson(this);

  @override
  List<Object?> get props => [
        id,
        url,
        name,
        type,
        language,
        genres,
        status,
        runtime,
        averageRuntime,
        premiered,
        ended,
        officialSite,
        rating,
        weight,
        network,
        image,
        schedule,
        summary,
        updated,
      ];

  @override
  bool get stringify => true;
}

@JsonSerializable(explicitToJson: true)
class ShowRating extends Equatable {
  final double? average;

  const ShowRating({
    required this.average,
  });

  factory ShowRating.fromJson(Map<String, dynamic> json) =>
      _$ShowRatingFromJson(json);

  Map<String, dynamic> toJson() => _$ShowRatingToJson(this);

  @override
  List<Object?> get props => [average];

  @override
  bool get stringify => true;
}

@JsonSerializable(explicitToJson: true)
class ShowSchedule extends Equatable {
  final String time;
  final List<String> days;

  const ShowSchedule({
    required this.time,
    required this.days,
  });

  @override
  List<Object?> get props => [time, days];

  @override
  bool get stringify => true;

  factory ShowSchedule.fromJson(Map<String, dynamic> json) =>
      _$ShowScheduleFromJson(json);

  Map<String, dynamic> toJson() => _$ShowScheduleToJson(this);
}
