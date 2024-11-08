import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather/app.dart';
import 'package:flutter_weather/weather_bloc_observer.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:weather_repository/weather_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  Bloc.observer = const WeatherBlocObserver();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );
  runApp(
    EasyLocalization(
      supportedLocales: [Locale("en"), Locale("my")],
      path: "assets/translations",
      child: WeatherApp(
        weatherRepository: WeatherRepository(),
      ),
    ),
  );
}
