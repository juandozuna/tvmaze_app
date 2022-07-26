import 'package:tvmaze_app/data/models/episode_model.dart';
import 'package:tvmaze_app/domain/entities/episode_entity.dart';

class EpisodeMapper {
  static EpisodeEntity toEntity(EpisodeModel model) => EpisodeEntity(
        id: model.id,
        name: model.name,
        season: model.season,
        number: model.number,
        image: model.image?.original ?? '',
        summary: model.summary ?? '',
      );

  static List<EpisodeEntity> toEntityList(List<EpisodeModel> models) =>
      models.map((model) => toEntity(model)).toList();
}
