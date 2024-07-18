class NewRecipe {
  final String title;
  final String description;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final String imageUrl;
  final List<String> tags;
  final List<String> mealType;
  final bool veg;

  NewRecipe({
    required this.title,
    required this.description,
    required this.ingredients,
    required this.steps,
    required this.duration,
    required this.imageUrl,
    required this.tags,
    required this.mealType,
    required this.veg,
  });
}
