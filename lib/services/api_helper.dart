part of 'services.dart';

class ApiHelper {
  static const String baseUrl = 'https://localhost:8000/api';

  static Map<String, String> getHeaders(String token) {
    return {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
  }

  static dynamic handleResponse(http.Response response) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed: ${response.statusCode}');
    }
  }

  static dynamic handleError(dynamic e) {
    print('Error: $e');
    throw Exception('Failed: $e');
  }
}