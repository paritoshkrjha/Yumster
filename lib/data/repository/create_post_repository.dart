import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:yumster/core/failure.dart';
import 'package:yumster/core/type_defs.dart';
import 'package:yumster/data/model/new_recipe.dart';
import 'package:http/http.dart' as http;
import 'package:yumster/data/model/recipe_model.dart';

class CreatePostRepository {
  FutureEither<RecipeModel> createPost(
      NewRecipeModel newRecipe, String token) async {
    try {
      final payload = {
        "title": newRecipe.title,
        "description": newRecipe.description,
        "steps": newRecipe.steps,
        "ingredients": newRecipe.ingredients,
        "duration": newRecipe.duration,
        "imageUrl": newRecipe.imageUrl,
        "mealType": newRecipe.mealType,
        "veg": newRecipe.veg,
        "tags": newRecipe.tags,
      };
      final response = await http.post(
        Uri.parse('http://192.168.0.104:8000/post'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(payload),
      );
      print(response.body);
      final responseJson = jsonDecode(response.body);
      if (response.statusCode != 201) {
        return left(Failure(responseJson['message']));
      }
      RecipeModel recipe = RecipeModel.fromMap(responseJson['post']);
      return right(recipe);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
