import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/login_model.dart';

abstract class LoginRemoteDataSource {
  Future<LoginModel> login(String email, String password);
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final http.Client client;

  LoginRemoteDataSourceImpl({required this.client});

  @override
  Future<LoginModel> login(String email, String password) async {
    print('DEBUG: Request ke API login'); // <--- debug

    final response = await client.post(
      Uri.parse('https://reqres.in/api/login'),
      headers: {
        'Content-Type': 'application/json',
        'x-api-key': 'reqres-free-v1',
      },
      body: json.encode({'email': email, 'password': password}),
    );

    print('DEBUG: Status code: ${response.statusCode}'); // <--- debug
    print('DEBUG: Response body: ${response.body}'); // <--- debug

    if (response.statusCode == 200) {
      final model = LoginModel.fromJson(json.decode(response.body));
      print('DEBUG: Model hasil parsing: $model'); // <--- debug
      return model;
    } else {
      final errorMessage = json.decode(response.body)['error'] ?? 'Login gagal';
      print('DEBUG: Error dari API: $errorMessage'); // <--- debug
      throw Exception(errorMessage);
    }
  }
}
