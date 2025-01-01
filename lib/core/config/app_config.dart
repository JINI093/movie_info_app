import 'package:flutter/foundation.dart';

class AppConfig {
  static const apiKey = String.fromEnvironment(
    'TMDB_API_KEY',
    defaultValue: '',
  );

  static void validate() {
    debugPrint('Current API Key: $apiKey');
    if (apiKey.isEmpty) {
      throw Exception(
        'API key not found. Make sure to run with --dart-define-from-file=.env',
      );
    }
  }
}
