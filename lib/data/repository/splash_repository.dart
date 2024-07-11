import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:yumster/core/failure.dart';
import 'package:yumster/core/type_defs.dart';
import 'package:http/http.dart' as http;
import 'package:yumster/data/model/user_model.dart';

class SplashRepository {
  FutureEither<UserModel?> validateToken({required String token}) async {
    try {
      final response = await http.get(
        Uri.parse('http://192.168.0.104:8000/user/validate-token'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode != 200) {
        return left(Failure('Token is invalid'));
      }

      final responseJson = jsonDecode(response.body);
      // UserModel user = UserModel.fromMap(responseJson['user']);
      // return right(user);
      return right(null);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
