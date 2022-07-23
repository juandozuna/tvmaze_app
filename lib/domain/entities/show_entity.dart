import 'package:equatable/equatable.dart';

class ShowEntity extends Equatable {
  final int id;
  final String name;
  final String type;
  final String imageUrl;
  final List<String> genres;
  final String status;
  final String network;

  const ShowEntity({
    required this.id,
    required this.name,
    required this.type,
    required this.imageUrl,
    required this.genres,
    required this.status,
    required this.network,
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
      ];

  @override
  bool get stringify => true;
}
