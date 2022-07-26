import 'package:equatable/equatable.dart';

class ShowViewModel extends Equatable {
  final int id;
  final String name;
  final String posterImage;
  final double rating;
  final List<String> genres;
  final String summary;
  final ScheduleViewModel? schedule;

  const ShowViewModel({
    required this.id,
    required this.name,
    required this.posterImage,
    required this.rating,
    required this.genres,
    required this.summary,
    required this.schedule,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        posterImage,
        rating,
        genres,
        summary,
        schedule,
      ];

  @override
  bool get stringify => true;
}

class ScheduleViewModel extends Equatable {
  final String time;
  final List<String> days;

  const ScheduleViewModel({
    required this.time,
    required this.days,
  });

  @override
  List<Object> get props => [
        time,
        days,
      ];

  @override
  bool get stringify => true;
}
