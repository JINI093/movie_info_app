class AppConfig {
  static const apiKey = String.fromEnvironment('TMDB_API_KEY');

  static void validate() {
    if (apiKey.isEmpty) {
      throw Exception(
        'API key not found. Make sure to run with --dart-define-from-file=.env',
      );
    }
  }
}
