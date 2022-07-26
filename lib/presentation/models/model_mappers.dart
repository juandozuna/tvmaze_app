import 'package:tvmaze_app/domain/entities/show_entity.dart';
import 'package:tvmaze_app/presentation/models/show_view_model.dart';

class ModelMappers {
  static ShowViewModel fromShowEntity(ShowEntity entity) {
    return ShowViewModel(
      id: entity.id,
      name: entity.name,
      posterImage: entity.imageUrl,
      rating: entity.rating,
      genres: entity.genres,
      summary: entity.summary,
      schedule:
          entity.schedule != null ? fromScheduleEntity(entity.schedule!) : null,
    );
  }

  static ScheduleViewModel fromScheduleEntity(ScheduleEntity entity) {
    return ScheduleViewModel(
      time: entity.time,
      days: entity.days,
    );
  }
}
