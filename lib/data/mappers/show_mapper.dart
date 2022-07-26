import 'package:tvmaze_app/core/constants.dart';
import 'package:tvmaze_app/data/models/show_model.dart';
import 'package:tvmaze_app/domain/entities/show_entity.dart';

class ShowMapper {
  static ShowEntity toEntity(ShowModel model) => ShowEntity(
        id: model.id,
        type: model.type,
        genres: model.genres.toList(),
        imageUrl: model.image?.original ?? placeholderImageUrl,
        name: model.name,
        network: model.network?.name ?? 'N/A',
        status: model.status,
        rating: model.rating?.average ?? 0,
      );

  static List<ShowEntity> toEntityList(List<ShowModel> models) =>
      models.map((model) => toEntity(model)).toList();
}
