import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:yumster/core/failure.dart';
import 'package:yumster/core/type_defs.dart';
import 'package:yumster/data/model/recipe_model.dart';
import 'package:http/http.dart' as http;
import 'package:yumster/data/model/user_model.dart';

class ProfileRepository {
  Future<List<RecipeModel>> getMyPosts(String token) async {
    try {
      final response = await http
          .get(Uri.parse('http://192.168.0.104:8000/post/my-posts'), headers: {
        'Authorization': 'Bearer $token',
      });
      if (response.statusCode != 200) {
        return [];
      }
      final responseJson = jsonDecode(response.body);
      List<RecipeModel> userPosts = [];
      responseJson['userPosts'].forEach((post) {
        userPosts.add(RecipeModel.fromMap(post));
      });
      return userPosts;
    } catch (e) {
      return [];
    }
  }

  FutureEither<UserModel> deletePost(
      {required String token, required String postId}) async {
    try {
      final response = await http.delete(
          Uri.parse('http://192.168.0.104:8000/post/$postId'),
          headers: {
            'Authorization': 'Bearer $token',
          });
      final responseJson = jsonDecode(response.body);
      if (response.statusCode != 200) {
        return left(Failure(responseJson['message']));
      }
      UserModel user = UserModel.fromMap(responseJson['user']);
      print('user.posts');
      return right(user);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
