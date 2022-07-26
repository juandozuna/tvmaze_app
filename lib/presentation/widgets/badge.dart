import 'package:flutter/material.dart';
import 'package:tvmaze_app/presentation/theme/app_theme.dart';

class Badge extends StatelessWidget {
  final String label;

  const Badge(this.label, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppValues.defaultPadding),
      margin: const EdgeInsets.symmetric(horizontal: AppValues.defaultMargin),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppValues.circularRadius),
        color: Theme.of(context).primaryColor,
      ),
      child: Text(label),
    );
  }
}
