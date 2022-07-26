import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tvmaze_app/data/models/show_model.dart';

part 'show_search_response_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ShowSearchResponseModel extends Equatable {
  final double score;
  final ShowModel show;

  const ShowSearchResponseModel({
    required this.score,
    required this.show,
  });

  @override
  List<Object> get props => [score, show];

  @override
  bool get stringify => true;

  factory ShowSearchResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ShowSearchResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShowSearchResponseModelToJson(this);
}
