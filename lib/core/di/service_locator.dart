import 'package:clean_arc/core/config/dev_config.dart';
import 'package:clean_arc/core/config/production_config.dart';
import 'package:clean_arc/core/config/staging_config.dart';

import 'package:clean_arc/core/config/environment.dart';
import 'package:clean_arc/core/netwrok/dio_network_client.dart';
import 'package:clean_arc/core/netwrok/network_client.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;
void setupDependencies(Environment environment) {
  final config = _getConfigForEnvironment(environment);

  sl.registerLazySingleton<AppConfig>(() => config);
  sl.registerLazySingleton<NetworkClient>(
      () => DioNetworkClient(sl<AppConfig>()));
}

AppConfig _getConfigForEnvironment(Environment environment) {
  switch (environment) {
    case Environment.development:
      return devConfig;
    case Environment.staging:
      return stagingConfig;
    case Environment.production:
      return prodConfig;
  }
}
