import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tvmaze_app/presentation/show_detail/show_detail_provider.dart';
import 'package:tvmaze_app/presentation/widgets/center_loading.dart';

class ShowDetailPage extends StatefulWidget {
  const ShowDetailPage({Key? key}) : super(key: key);

  @override
  _ShowDetailPageState createState() => _ShowDetailPageState();
}

class _ShowDetailPageState extends State<ShowDetailPage> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ShowDetailProvider>(context);

    return _buildScaffold(
      const Text('showDetailProvider.selectedShow'),
      provider,
    );
  }

  Widget _buildScaffold(Widget child, ShowDetailProvider provider) {
    return Scaffold(
      appBar: _buildAppBar(provider),
      body: child,
    );
  }

  PreferredSizeWidget _buildAppBar(ShowDetailProvider provider) {
    final hasShow = provider.hasShow;
    if (!hasShow) {
      return AppBar(
        title: const CenterLoading(),
      );
    }

    final show = provider.selectedShow!;
    return AppBar(
      title: Text(show.name),
    );
  }
}
