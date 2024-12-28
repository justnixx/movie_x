import 'dart:developer';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_x/constants/strings.dart';

class ApiService {
  final String baseUrl;
  final Map<String, String>? headers;

  const ApiService({required this.baseUrl, this.headers});

  Future<dynamic> get(String endpoint) async {
    final url = Uri.parse('$baseUrl$endpoint');

    try {
      final response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception(
            '${AppStrings.failedToLoadData}: ${response.statusCode}');
      }
    } catch (e) {
      final errorMessage = '${AppStrings.errorFetchingData}: $e';
      log(errorMessage);
      throw Exception(errorMessage);
    }
  }
}
