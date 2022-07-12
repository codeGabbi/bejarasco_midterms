import 'package:fake_store/models/user_login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {

  static const String baseUrl = 'https://fakestoreapi.com';

  Future<dynamic> login(String username, String password) {
    final credentials = UserLogin(username: username, password: password);
    return http
        .post(Uri.parse('$baseUrl/auth/login'), body: credentials.toJson())
        .then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        return jsonData;
      }
    }).catchError((err) => print(err));
  }
}
