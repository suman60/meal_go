import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_logger.dart';
import 'api_exception.dart';

class ApiClient {
  final String baseUrl;
  final Map<String, String> defaultHeaders;

  ApiClient({
    required this.baseUrl,
    this.defaultHeaders = const {
      'Content-Type': 'application/json',
    },
  });

  Future<dynamic> request({
    required String endpoint,
    String method = 'GET',
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  }) async {
    final uri = Uri.parse('$baseUrl/$endpoint');
    final mergedHeaders = {...defaultHeaders, ...?headers};

    ApiLogger.logRequest(
      method: method,
      url: uri.toString(),
      body: body,
      headers: mergedHeaders,
    );

    late http.Response response;

    try {
      switch (method.toUpperCase()) {
        case 'POST':
          response = await http.post(
            uri,
            headers: mergedHeaders,
            body: jsonEncode(body),
          );
          break;

        case 'PUT':
          response = await http.put(
            uri,
            headers: mergedHeaders,
            body: jsonEncode(body),
          );
          break;

        case 'DELETE':
          response = await http.delete(
            uri,
            headers: mergedHeaders,
          );
          break;

        case 'GET':
        default:
          response = await http.get(
            uri,
            headers: mergedHeaders,
          );
      }

      ApiLogger.logResponse(
        statusCode: response.statusCode,
        response: response.body,
      );

      final decoded = jsonDecode(response.body);

      if (response.statusCode >= 200 &&
          response.statusCode < 300) {
        return decoded;
      } else {
        throw ApiException(
          message: decoded['message'] ?? 'API request failed',
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      ApiLogger.logError(
        method: method,
        url: uri.toString(),
        error: e,
      );
      rethrow;
    }
  }
}
