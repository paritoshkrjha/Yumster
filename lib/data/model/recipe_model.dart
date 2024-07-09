// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class RecipeModel {
  final String id;
  final String title;
  final String description;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final String imageUrl;
  final Map<String, String> author;
  final List<String> likes;
  final int views;
  final String mealType;
  final bool veg;
  final List<String> tags;

  RecipeModel({
    required this.id,
    required this.title,
    required this.description,
    required this.ingredients,
    required this.steps,
    required this.duration,
    required this.imageUrl,
    required this.author,
    required this.likes,
    required this.views,
    required this.mealType,
    required this.veg,
    required this.tags,
  });

  RecipeModel copyWith({
    String? id,
    String? title,
    String? description,
    List<String>? ingredients,
    List<String>? steps,
    int? duration,
    String? imageUrl,
    Map<String, String>? author,
    List<String>? likes,
    int? views,
    String? mealType,
    bool? veg,
    List<String>? tags,
  }) {
    return RecipeModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      ingredients: ingredients ?? this.ingredients,
      steps: steps ?? this.steps,
      duration: duration ?? this.duration,
      imageUrl: imageUrl ?? this.imageUrl,
      author: author ?? this.author,
      likes: likes ?? this.likes,
      views: views ?? this.views,
      mealType: mealType ?? this.mealType,
      veg: veg ?? this.veg,
      tags: tags ?? this.tags,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'ingredients': ingredients,
      'steps': steps,
      'duration': duration,
      'imageUrl': imageUrl,
      'author': author,
      'likes': likes,
      'views': views,
      'mealType': mealType,
      'veg': veg,
      'tags': tags,
    };
  }

  factory RecipeModel.fromMap(Map<String, dynamic> map) {
    return RecipeModel(
      id: map['id'] as String,
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
      author: Map<String, String>.from(
        (map['author'] as Map<String, String>),
      ),
      likes: List<String>.from(
        (map['likes'] as List<String>),
      ),
      views: map['views'] as int,
      mealType: map['mealType'] as String,
      veg: map['veg'] as bool,
      tags: List<String>.from(
        (map['tags'] as List<String>),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory RecipeModel.fromJson(String source) =>
      RecipeModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RecipeModel(id: $id, title: $title, description: $description, ingredients: $ingredients, steps: $steps, duration: $duration, imageUrl: $imageUrl, author: $author, likes: $likes, views: $views, mealType: $mealType, veg: $veg, tags: $tags)';
  }

  @override
  bool operator ==(covariant RecipeModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.description == description &&
        listEquals(other.ingredients, ingredients) &&
        listEquals(other.steps, steps) &&
        other.duration == duration &&
        other.imageUrl == imageUrl &&
        mapEquals(other.author, author) &&
        listEquals(other.likes, likes) &&
        other.views == views &&
        other.mealType == mealType &&
        other.veg == veg &&
        listEquals(other.tags, tags);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        ingredients.hashCode ^
        steps.hashCode ^
        duration.hashCode ^
        imageUrl.hashCode ^
        author.hashCode ^
        likes.hashCode ^
        views.hashCode ^
        mealType.hashCode ^
        veg.hashCode ^
        tags.hashCode;
  }
}
