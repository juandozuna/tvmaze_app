import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'episode_model.g.dart';

@JsonSerializable()
class EpisodeModel extends Equatable {
  const EpisodeModel({
    required this.id,
    required this.url,
    required this.name,
    required this.season,
    required this.number,
    required this.type,
    required this.airdate,
    required this.airtime,
    required this.airstamp,
    required this.runtime,
    required this.rating,
    required this.image,
    required this.summary,
    required this.links,
  });

  final int id;
  final String url;
  final String name;
  final int season;
  final int number;
  final String? type;
  final DateTime? airdate;
  final String? airtime;
  final DateTime? airstamp;
  final int? runtime;
  final EpisodeRating? rating;
  final EpisodeImage? image;
  final String? summary;
  final EpisodeLinks? links;

  @override
  List<Object?> get props => [
        id,
        url,
        name,
        season,
        number,
        type,
        airdate,
        airtime,
        airstamp,
        runtime,
        rating,
        image,
        summary,
        links,
      ];

  @override
  bool get stringify => true;

  factory EpisodeModel.fromJson(Map<String, dynamic> json) =>
      _$EpisodeModelFromJson(json);

  Map<String, dynamic> toJson() => _$EpisodeModelToJson(this);
}

@JsonSerializable()
class EpisodeImage extends Equatable {
  const EpisodeImage({
    required this.medium,
    required this.original,
  });

  final String medium;
  final String original;

  @override
  List<Object?> get props => [
        medium,
        original,
      ];

  @override
  bool get stringify => true;

  factory EpisodeImage.fromJson(Map<String, dynamic> json) =>
      _$EpisodeImageFromJson(json);

  Map<String, dynamic> toJson() => _$EpisodeImageToJson(this);
}

@JsonSerializable()
class EpisodeLinks extends Equatable {
  const EpisodeLinks({
    required this.self,
  });

  final EpisodeSelf? self;

  @override
  List<Object?> get props => [
        self,
      ];

  @override
  bool get stringify => true;

  factory EpisodeLinks.fromJson(Map<String, dynamic> json) =>
      _$EpisodeLinksFromJson(json);

  Map<String, dynamic> toJson() => _$EpisodeLinksToJson(this);
}

@JsonSerializable()
class EpisodeSelf extends Equatable {
  EpisodeSelf({
    required this.href,
  });

  final String? href;

  @override
  List<Object?> get props => [
        href,
      ];

  @override
  bool get stringify => true;

  factory EpisodeSelf.fromJson(Map<String, dynamic> json) =>
      _$EpisodeSelfFromJson(json);

  Map<String, dynamic> toJson() => _$EpisodeSelfToJson(this);
}

@JsonSerializable()
class EpisodeRating extends Equatable {
  EpisodeRating({
    required this.average,
  });

  final double? average;

  @override
  List<Object?> get props => [
        average,
      ];

  @override
  bool get stringify => true;

  factory EpisodeRating.fromJson(Map<String, dynamic> json) =>
      _$EpisodeRatingFromJson(json);

  Map<String, dynamic> toJson() => _$EpisodeRatingToJson(this);
}
