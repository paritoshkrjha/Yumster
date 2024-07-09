import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yumster/data/model/recipe_model.dart';

final recipeListProvider =
    StateNotifierProvider<RecipeListNotifier, List<RecipeModel>>((ref) {
  return RecipeListNotifier();
});

class RecipeListNotifier extends StateNotifier<List<RecipeModel>> {
  RecipeListNotifier() : super([kTempRecipeMpodel]);

  void fetchRecipes() {
    // Fetch recipes from the API
  }
}

final kTempRecipeMpodel = RecipeModel(
    id: "668bd151fa338179d7864fec",
    title: "Tuscan White Bean Soup",
    description:
        "A hearty and healthy Tuscan white bean soup that is easy to make and full of flavor. This soup is made with fresh vegetables, white beans, and a touch of rosemary.",
    ingredients: [
      "1 tablespoon olive oil",
      "1 medium onion, chopped",
      "2 carrots, chopped",
      "2 celery stalks, chopped",
      "4 cloves garlic, minced",
      "6 cups vegetable broth",
      "2 (15 oz) cans white beans, drained and rinsed",
      "1 (14.5 oz) can diced tomatoes",
      "1 cup small pasta",
      "1 tablespoon chopped fresh rosemary",
      "1/4 cup chopped fresh parsley",
      "Salt and black pepper, to taste",
      "Grated Parmesan cheese, for serving"
    ],
    steps: [
      "In a large pot, heat the olive oil over medium heat.",
      " Add the onion, carrots, and celery and cook until vegetables are tender, about 5 minutes.",
      " Add the garlic and cook for an additional 2 minutes.",
      "Add the vegetable broth, white beans, diced tomatoes, pasta, and rosemary. Stir and bring to a boil.",
      " Reduce heat and simmer for 15 minutes.",
      "Stir in the parsley and season with salt and black pepper, to taste.",
      " Ladle soup into bowls and serve with grated Parmesan cheese, if desired."
    ],
    duration: 30,
    imageUrl:
        "https://www.twopeasandtheirpod.com/wp-content/uploads/2021/01/Tuscan-White-Bean-Soup-3.jpg",
    author: {
      "_id": "6683cac4e62e111942e54311",
      "username": "user3",
    },
    likes: ["6683cac4e62e111942e54311"],
    views: 0,
    mealType: "Lunch",
    veg: true,
    tags: ["soup", "vegetarian", "vegan", "gluten free"]);
