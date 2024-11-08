import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class WeatherLoading extends StatelessWidget {
  const WeatherLoading({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('⛅', style: TextStyle(fontSize: 64)),
        Text(
          'weather.loadingBody',
          style: theme.textTheme.headlineSmall,
        ).tr(),
        const Padding(
          padding: EdgeInsets.all(16),
          child: CircularProgressIndicator(),
        ),
      ],
    );
  }
}
