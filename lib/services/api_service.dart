import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String apiUrl = "http://10.0.2.2:8080";

  Future<Map<String, dynamic>?> createUser(
      Map<String, dynamic> userData) async {
    final Uri uri = Uri.parse('$apiUrl/users');

    try {
      final response = await http.post(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(userData),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print('Failed to create user. Error: ${response.statusCode}');
        return null;
      }
    } catch (error) {
      print('Error creating user: $error');
      return null;
    }
  }

  // Update liquid data
  Future<Map<String, dynamic>?> updateLiquid(
      int userId, String liquidType) async {
    final Uri uri = Uri.parse('$apiUrl/users/liquid/$userId');

    try {
      final response = await http.post(
        uri,
        body: liquidType,
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print('Failed to update user. Error: ${response.statusCode}');
        return null;
      }
    } catch (error) {
      print('Error updating user: $error');
      return null;
    }
  }

  // Create meal
  Future<Map<String, dynamic>?> createMeal(Map<String, dynamic> data) async {
    final Uri uri = Uri.parse('$apiUrl/meals');

    try {
      final response = await http.post(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print('Failed to create meal. Error: ${response.statusCode}');
        return null;
      }
    } catch (error) {
      print('Error creating meal: $error');
      return null;
    }
  }

  // Get user data
  Future<Map<String, dynamic>?> getUserData(int userId) async {
    final Uri uri = Uri.parse('$apiUrl/users/$userId');

    try {
      final response = await http.get(
        uri,
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print('Failed to get user data. Error: ${response.statusCode}');
        return null;
      }
    } catch (error) {
      print('Error getting user data: $error');
      return null;
    }
  }
}
