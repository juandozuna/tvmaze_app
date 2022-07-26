import 'package:equatable/equatable.dart';

class ShowEntity extends Equatable {
  final int id;
  final String name;
  final String type;
  final String imageUrl;
  final List<String> genres;
  final String status;
  final String network;
  final double rating;
  final String summary;
  final ScheduleEntity? schedule;

  const ShowEntity({
    required this.id,
    required this.name,
    required this.type,
    required this.imageUrl,
    required this.genres,
    required this.status,
    required this.network,
    required this.rating,
    required this.summary,
    required this.schedule,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        type,
        imageUrl,
        genres,
        status,
        network,
        rating,
        summary,
        schedule,
      ];

  @override
  bool get stringify => true;
}

class ScheduleEntity extends Equatable {
  final String time;
  final List<String> days;

  const ScheduleEntity({
    required this.time,
    required this.days,
  });

  @override
  List<Object?> get props => [
        time,
        days,
      ];

  @override
  bool get stringify => true;
}
