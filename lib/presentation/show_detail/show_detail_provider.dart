import 'package:tvmaze_app/domain/useCases/get_show_by_id_use_case.dart';
import 'package:tvmaze_app/presentation/models/model_mappers.dart';
import 'package:tvmaze_app/presentation/models/show_view_model.dart';
import 'package:tvmaze_app/presentation/providers/base_notifier_provider.dart';

class ShowDetailProvider extends BaseNotifierProvider {
  final GetShowByIdUseCase _getShowByIdUseCase;

  ShowDetailProvider(this._getShowByIdUseCase);

  // State properties
  int? selectedShowId;
  ShowViewModel? selectedShow;

  void getShow(int id) async {
    selectedShowId = id;
    notifyListeners();

    startLoading();

    final result = await _getShowByIdUseCase(id);

    if (result.isFailure) {
      setError(result.asFailure.error);
      return;
    }

    final data = result.asSuccess.value;
    selectedShow = ModelMappers.fromShowEntity(data);
    stopLoading();
  }

  @override
  void resetProvider() {
    super.resetProvider();
    selectedShowId = null;
    selectedShow = null;
  }
}
