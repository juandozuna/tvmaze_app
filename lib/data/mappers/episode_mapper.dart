import 'package:collection/collection.dart';
import 'package:tvmaze_app/data/models/episode_model.dart';
import 'package:tvmaze_app/domain/entities/episode_entity.dart';
import 'package:tvmaze_app/domain/entities/season_entity.dart';

class EpisodeMapper {
  static EpisodeEntity toEntity(EpisodeModel model) => EpisodeEntity(
        id: model.id,
        name: model.name,
        season: model.season,
        number: model.number,
        image: model.image?.original ?? '',
        summary: model.summary ?? '',
      );

  static List<SeasonEntity> toEntityList(List<EpisodeModel> models) {
    final List<EpisodeEntity> episodes =
        models.map((model) => toEntity(model)).toList();

    final group = groupBy<EpisodeEntity, int>(episodes, (e) => e.season);
    final seasons = group.entries
        .map((e) => SeasonEntity(season: e.key, episodes: e.value))
        .toList();
    return seasons;
  }
}
