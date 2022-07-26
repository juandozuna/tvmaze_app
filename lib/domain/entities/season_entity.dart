import 'package:equatable/equatable.dart';
import 'package:tvmaze_app/domain/entities/episode_entity.dart';

class SeasonEntity extends Equatable {
  final int season;
  final List<EpisodeEntity> episodes;

  const SeasonEntity({
    required this.season,
    required this.episodes,
  });

  @override
  List<Object?> get props => [
        season,
        episodes,
      ];

  @override
  bool get stringify => true;
}
