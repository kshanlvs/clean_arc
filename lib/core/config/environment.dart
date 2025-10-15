
enum Environment { development, staging, production }

class AppConfig {
  final Environment environment;
  final String baseUrl;

  AppConfig._internal(this.environment, this.baseUrl);

  factory AppConfig(Environment environment, String baseUrl) {
    return AppConfig._internal(environment, baseUrl);
  }
}
