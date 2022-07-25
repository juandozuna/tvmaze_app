import 'package:tvmaze_app/domain/entities/show_entity.dart';
import 'package:tvmaze_app/presentation/models/single_show.dart';

class ModelMappers {
  static SingleShow fromShowEntity(ShowEntity entity) {
    return SingleShow(
      id: entity.id,
      name: entity.name,
      posterImage: entity.imageUrl,
      rating: entity.rating,
    );
  }
}
