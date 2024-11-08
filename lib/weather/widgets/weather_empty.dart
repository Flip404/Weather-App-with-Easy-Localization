import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class WeatherEmpty extends StatelessWidget {
  const WeatherEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('🏙️', style: TextStyle(fontSize: 64)),
        Text(
          "weather.emptyBody",
          style: theme.textTheme.headlineSmall,
        ).tr(),
      ],
    );
  }
}
