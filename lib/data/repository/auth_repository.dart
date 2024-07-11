import 'dart:convert';
import 'package:fpdart/fpdart.dart';
import 'package:yumster/core/failure.dart';
import 'package:yumster/core/local/device_storage.dart';
import 'package:yumster/core/type_defs.dart';
import 'package:yumster/data/model/user_model.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  FutureEither<void> login({
    required String email,
    required String password,
  }) async {
    try {
      final payload = {
        "email": email,
        "password": password,
      };

      final response = await http.post(
        Uri.parse('http://192.168.0.104:8000/user/login'),
        body: jsonEncode(payload),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      final responseJson = jsonDecode(response.body);

      // Check if the response is successful
      if (response.statusCode != 200) {
        return left(Failure(responseJson['message'] ?? 'An error occurred '));
      }

      DeviceStorage().write(key: 'token', value: responseJson['token']);

      return right(null);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  FutureEither<void> signUp(UserModel user) async {
    try {
      final payload = {
        "username": user.username,
        "email": user.email,
        "password": user.password,
      };

      final response = await http.post(
        Uri.parse('http://192.168.0.104:8000/user/signup'),
        body: jsonEncode(payload),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      final responseJson = jsonDecode(response.body);

      // Check if the response is successful
      if (response.statusCode != 201) {
        return left(Failure(responseJson['message'] ?? 'An error occurred '));
      }

      DeviceStorage().write(key: 'token', value: responseJson['token']);

      return right(null);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  FutureEither<void> handleLogOut() async {
    try {
      DeviceStorage().delete(key: 'token');
      return right(null);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
