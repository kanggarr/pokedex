import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'http://10.0.2.2:3000';

  Future<Map<String, dynamic>> signIn(String username, String password) async {
    final url = Uri.parse('$baseUrl/sign-in');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': username, 'password': password}),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to sign in: ${response.reasonPhrase}');
    }
  }

  Future<Map<String, dynamic>> getPokedex(String accessToken) async {
    final url = Uri.parse('$baseUrl/pokedex');
    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $accessToken'},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to get pokedex: ${response.reasonPhrase}');
    }
  }
}
