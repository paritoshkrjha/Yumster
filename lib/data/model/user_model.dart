// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class UserModel {
  final String name;
  final String email;
  final String password;
  final List<String> preferences;
  final List<String> posts;
  final List<String> savedPosts;
  final String avatar;

  UserModel({
    required this.name,
    required this.email,
    required this.password,
    required this.preferences,
    required this.posts,
    required this.savedPosts,
    required this.avatar,
  });

  UserModel copyWith({
    String? name,
    String? email,
    String? password,
    List<String>? preferences,
    List<String>? posts,
    List<String>? savedPosts,
    String? avatar,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      preferences: preferences ?? this.preferences,
      posts: posts ?? this.posts,
      savedPosts: savedPosts ?? this.savedPosts,
      avatar: avatar ?? this.avatar,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'password': password,
      'preferences': preferences,
      'posts': posts,
      'savedPosts': savedPosts,
      'avatar': avatar,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      preferences: List<String>.from((map['preferences'] as List<String>),),    
      posts: List<String>.from((map['posts'] as List<String>),),    
      savedPosts: List<String>.from((map['savedPosts'] as List<String>),),    
      avatar: map['avatar'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(name: $name, email: $email, password: $password, preferences: $preferences, posts: $posts, savedPosts: $savedPosts, avatar: $avatar)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.email == email &&
      other.password == password &&
      listEquals(other.preferences, preferences) &&
      listEquals(other.posts, posts) &&
      listEquals(other.savedPosts, savedPosts) &&
      other.avatar == avatar;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      email.hashCode ^
      password.hashCode ^
      preferences.hashCode ^
      posts.hashCode ^
      savedPosts.hashCode ^
      avatar.hashCode;
  }
}
