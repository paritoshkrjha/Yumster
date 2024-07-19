// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class NewRecipeModel {
  final String title;
  final String description;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final String imageUrl;
  final List<String> tags;
  final String mealType;
  final bool veg;

  NewRecipeModel({
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

  NewRecipeModel copyWith({
    String? title,
    String? description,
    List<String>? ingredients,
    List<String>? steps,
    int? duration,
    String? imageUrl,
    List<String>? tags,
    String? mealType,
    bool? veg,
  }) {
    return NewRecipeModel(
      title: title ?? this.title,
      description: description ?? this.description,
      ingredients: ingredients ?? this.ingredients,
      steps: steps ?? this.steps,
      duration: duration ?? this.duration,
      imageUrl: imageUrl ?? this.imageUrl,
      tags: tags ?? this.tags,
      mealType: mealType ?? this.mealType,
      veg: veg ?? this.veg,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'ingredients': ingredients,
      'steps': steps,
      'duration': duration,
      'imageUrl': imageUrl,
      'tags': tags,
      'mealType': mealType,
      'veg': veg,
    };
  }

  factory NewRecipeModel.fromMap(Map<String, dynamic> map) {
    return NewRecipeModel(
      title: map['title'] as String,
      description: map['description'] as String,
      ingredients: List<String>.from(
        (map['ingredients'] as List<String>),
      ),
      steps: List<String>.from(
        (map['steps'] as List<String>),
      ),
      duration: map['duration'] as int,
      imageUrl: map['imageUrl'] as String,
      tags: List<String>.from(
        (map['tags'] as List<String>),
      ),
      mealType: map['mealType'] as String,
      veg: map['veg'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory NewRecipeModel.fromJson(String source) =>
      NewRecipeModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'NewRecipeModel(title: $title, description: $description, ingredients: $ingredients, steps: $steps, duration: $duration, imageUrl: $imageUrl, tags: $tags, mealType: $mealType, veg: $veg)';
  }

  @override
  bool operator ==(covariant NewRecipeModel other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.description == description &&
        listEquals(other.ingredients, ingredients) &&
        listEquals(other.steps, steps) &&
        other.duration == duration &&
        other.imageUrl == imageUrl &&
        listEquals(other.tags, tags) &&
        other.mealType == mealType &&
        other.veg == veg;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        description.hashCode ^
        ingredients.hashCode ^
        steps.hashCode ^
        duration.hashCode ^
        imageUrl.hashCode ^
        tags.hashCode ^
        mealType.hashCode ^
        veg.hashCode;
  }
}
