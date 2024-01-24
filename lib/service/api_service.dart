import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<void> register({
    required String email,
    required String password,
    required String firstname,
    required String lastname,
    required String username,
  }) async {
    try {
      final response = await _dio.post(
        'your_base_url/auth/register',
        data: {
          'email': email,
          'password': password,
          'firstname': firstname,
          'lastname': lastname,
          'username': username,
          'farms': [], // You can modify this based on your model
        },
      );

      // Check response status and handle accordingly
      if (response.statusCode == 200) {
        // Registration successful
        print('Registration successful');
      } else {
        // Registration failed
        print('Registration failed: ${response.data}');
      }
    } catch (e) {
      // Handle error
      print('Error during registration: $e');
    }
  }
}
