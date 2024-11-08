import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/weather/weather.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage._();

  static Route<void> route() {
    return MaterialPageRoute<void>(
      builder: (_) => const SettingsPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('setting.title').tr()),
      body: ListView(
        children: <Widget>[
          BlocBuilder<WeatherCubit, WeatherState>(
            buildWhen: (previous, current) =>
                previous.temperatureUnits != current.temperatureUnits,
            builder: (context, state) {
              return ListTile(
                title: Text('setting.temperature.title').tr(),
                isThreeLine: true,
                subtitle: Text('setting.temperature.subtitle').tr(),
                trailing: Switch(
                  value: state.temperatureUnits.isCelsius,
                  onChanged: (_) => context.read<WeatherCubit>().toggleUnits(),
                ),
              );
            },
          ),
          ListTile(
            title: Text('setting.language.title').tr(),
            isThreeLine: true,
            subtitle: Text("setting.language.subtitle").tr(),
            trailing: Switch(
              value: context.locale == Locale('en'),
              onChanged: (isTrue) async {
                if (isTrue) {
                  await context.setLocale(Locale("en"));
                } else {
                  await context.setLocale(Locale("my"));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
