import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'show_image_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ShowImageModel extends Equatable {
  final String medium;
  final String original;

  const ShowImageModel({
    required this.medium,
    required this.original,
  });

  factory ShowImageModel.fromJson(Map<String, dynamic> json) =>
      _$ShowImageModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShowImageModelToJson(this);

  @override
  List<Object?> get props => [
        medium,
        original,
      ];

  @override
  bool get stringify => true;
}
