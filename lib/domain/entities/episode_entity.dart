import 'package:equatable/equatable.dart';

class EpisodeEntity extends Equatable {
  EpisodeEntity({
    required this.id,
    required this.name,
    required this.season,
    required this.number,
    required this.image,
    required this.summary,
  });

  final int id;
  final String name;
  final int season;
  final int number;
  final String image;
  final String summary;

  @override
  List<Object?> get props => [
        id,
        name,
        season,
        number,
        image,
        summary,
      ];

  @override
  bool get stringify => true;
}
