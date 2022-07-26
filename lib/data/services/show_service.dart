import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:tvmaze_app/data/models/episode_model.dart';
import 'package:tvmaze_app/data/models/show_model.dart';
import 'package:tvmaze_app/data/models/show_search_response_model.dart';

part 'show_service.g.dart';

@RestApi()
abstract class ShowService {
  factory ShowService(Dio dio, {String baseUrl}) = _ShowService;

  @GET('/shows')
  Future<List<ShowModel>> getShows([@Query('page') int page = 0]);

  @GET('/search/shows')
  Future<List<ShowSearchResponseModel>> getShowsByName(@Query('q') String name);

  @GET('/shows/{id}')
  Future<ShowModel> getShowById(@Path('id') int id);

  @GET('/shows/{id}/episodes')
  Future<List<EpisodeModel>> getEpisodesForShow(@Path('id') int showId);

  @GET('/episodes/{id}')
  Future<EpisodeModel> getEpisodeById(@Path('id') int episodeId);
}
