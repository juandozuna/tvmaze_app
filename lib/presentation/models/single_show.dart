import 'package:equatable/equatable.dart';

class SingleShow extends Equatable {
  final int id;
  final String name;
  final String posterImage;
  final double rating;

  const SingleShow({
    required this.id,
    required this.name,
    required this.posterImage,
    required this.rating,
  });

  @override
  List<Object> get props => [
        id,
        name,
        posterImage,
        rating,
      ];

  @override
  bool get stringify => true;
}
