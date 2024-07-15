import 'dart:convert';
import 'package:fpdart/fpdart.dart';
import 'package:yumster/core/failure.dart';
import 'package:yumster/core/type_defs.dart';
import 'package:http/http.dart' as http;
import 'package:yumster/data/model/recipe_model.dart';
import 'package:yumster/data/model/user_model.dart';

class FeedRepository {
  Future<List<RecipeModel>> getRecipePosts(String token) async {
    try {
      final response =
          await http.get(Uri.parse('http://192.168.0.104:8000/post'), headers: {
        'Authorization': 'Bearer $token',
      });
      if (response.statusCode != 200) {
        return [];
      }
      final responseJson = jsonDecode(response.body);
      List<RecipeModel> recipes = [];
      responseJson['posts'].forEach((post) {
        recipes.add(RecipeModel.fromMap(post));
      });
      return recipes;
    } catch (e) {
      return [];
    }
  }

  FutureEither<RecipeModel> likePost(String postId, String token) async {
    try {
      final response = await http.post(
        Uri.parse('http://192.168.0.104:8000/post/$postId/like'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode != 200) {
        return left(Failure('An error occurred'));
      }

      final responseJson = jsonDecode(response.body);
      RecipeModel recipe = RecipeModel.fromMap(responseJson['post']);
      return right(recipe);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  FutureEither<UserModel> starPost(String postId, String token) async {
    try {
      final response = await http.post(
        Uri.parse('http://192.168.0.104:8000/post/$postId/star'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode != 200) {
        return left(Failure('An error occurred'));
      }
      final responseJson = jsonDecode(response.body);
      UserModel user = UserModel.fromMap(responseJson['user']);
      return right(user);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  FutureEither<RecipeModel> updateViewCount(String postId, String token) async {
    try {
      final response = await http.post(
          Uri.parse("http://192.168.0.104:8000/post/$postId/view"),
          headers: {
            'Authorization': 'Bearer $token',
          });
      if (response.statusCode != 200) {
        return left(Failure('An error occurred'));
      }
      final responseJson = jsonDecode(response.body);
      RecipeModel recipe = RecipeModel.fromMap(responseJson['post']);
      return right(recipe);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  Future<List<RecipeModel>> getStarredPosts(String token) async {
    try {
      final response = await http
          .get(Uri.parse('http://192.168.0.104:8000/post/starred'), headers: {
        'Authorization': 'Bearer $token',
      });
      if (response.statusCode != 200) {
        return [];
      }
      final responseJson = jsonDecode(response.body);
      List<RecipeModel> recipes = [];
      responseJson['starredPosts'].forEach((post) {
        recipes.add(RecipeModel.fromMap(post));
      });
      return recipes;
    } catch (e) {
      return [];
    }
  }
}
