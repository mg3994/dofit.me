class WordPressConfig {
  final int fitnessRootCategoryId;

  const WordPressConfig({required this.fitnessRootCategoryId});

  factory WordPressConfig.fromEnvironment() {
    return const WordPressConfig(
      fitnessRootCategoryId: int.fromEnvironment(
        'FITNESS_ROOT_CATEGORY_ID',
        defaultValue: 64,
      ),
    );
  }
}

class AppConfig {
  final String apiBaseUrl;
  final bool enableLogging;
  final int connectionTimeout;
  final int receiveTimeout;
  final WordPressConfig wordPressConfig;

  const AppConfig({
    required this.apiBaseUrl,
    this.enableLogging = false,
    this.connectionTimeout = 30000,
    this.receiveTimeout = 30000,
    this.wordPressConfig = const WordPressConfig(fitnessRootCategoryId: 64),
  });

  // Factory to create from environment variables
  factory AppConfig.fromEnvironment() {
    return AppConfig(
      apiBaseUrl: const String.fromEnvironment(
        'API_BASE_URL',
        defaultValue: 'https://www.dofit.me/',
      ),
      enableLogging: const bool.fromEnvironment(
        'ENABLE_LOGGING',
        defaultValue: false,
      ),
      connectionTimeout: const int.fromEnvironment(
        'CONNECTION_TIMEOUT',
        defaultValue: 30000,
      ),
      receiveTimeout: const int.fromEnvironment(
        'RECEIVE_TIMEOUT',
        defaultValue: 30000,
      ),
      wordPressConfig: WordPressConfig.fromEnvironment(),
    );
  }
}
