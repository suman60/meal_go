import 'package:flutter/foundation.dart';

class ApiLogger {
  static void logRequest({
    required String method,
    required String url,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  }) {
    if (kReleaseMode) return;

    debugPrint('🚀 API REQUEST');
    debugPrint('➡️ $method $url');

    if (headers != null) {
      debugPrint('🧾 Headers: $headers');
    }

    if (body != null) {
      debugPrint('📦 Body: $body');
    }
  }

  static void logResponse({required int statusCode, required String response}) {
    if (kReleaseMode) return;

    debugPrint('✅ API RESPONSE');
    debugPrint('📥 Status: $statusCode');
    debugPrint('📄 Body: $response');
  }

  static void logError({
    required String method,
    required String url,
    required dynamic error,
  }) {
    if (kReleaseMode) return;

    debugPrint('❌ API ERROR');
    debugPrint('➡️ $method $url');
    debugPrint('💥 Error: $error');
  }
}
