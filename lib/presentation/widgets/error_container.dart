import 'package:flutter/material.dart';
import 'package:tvmaze_app/presentation/theme/app_theme.dart';

class ErrorContainer extends StatelessWidget {
  final String errorMessage;

  const ErrorContainer({
    Key? key,
    required this.errorMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Theme.of(context).errorColor,
        borderRadius: BorderRadius.circular(AppValues.defaultBorderRadius),
      ),
      child: Text(errorMessage),
    );
  }
}
