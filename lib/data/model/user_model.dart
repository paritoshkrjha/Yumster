// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class UserModel {
  final String id;
  final String username;
  final String email;
  final String password;
  final List<String> preferences;
  final List<String> posts;
  final List<String> starredPosts;
  final String avatarUrl;

  UserModel({
    required this.id,
    required this.username,
    required this.email,
    this.password = '',
    required this.preferences,
    required this.posts,
    required this.starredPosts,
    required this.avatarUrl,
  });

  UserModel copyWith({
    String? id,
    String? username,
    String? email,
    String? password,
    List<String>? preferences,
    List<String>? posts,
    List<String>? starredPosts,
    String? avatarUrl,
  }) {
    return UserModel(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      preferences: preferences ?? this.preferences,
      posts: posts ?? this.posts,
      starredPosts: starredPosts ?? this.starredPosts,
      avatarUrl: avatarUrl ?? this.avatarUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'username': username,
      'email': email,
      'password': password,
      'preferences': preferences,
      'posts': posts,
      'starredPosts': starredPosts,
      'avatarUrl': avatarUrl,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['_id'] as String,
      username: map['username'] as String,
      email: map['email'] as String,
      preferences: List<String>.from(
        (map['preferences']),
      ),
      posts: List<String>.from(
        (map['posts']),
      ),
      starredPosts: List<String>.from(
        (map['starredPosts']),
      ),
      avatarUrl: map['avatarUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(id: $id, username: $username, email: $email, password: $password, preferences: $preferences, posts: $posts, starredPosts: $starredPosts, avatarUrl: $avatarUrl)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.username == username &&
        other.email == email &&
        other.password == password &&
        listEquals(other.preferences, preferences) &&
        listEquals(other.posts, posts) &&
        listEquals(other.starredPosts, starredPosts) &&
        other.avatarUrl == avatarUrl;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        username.hashCode ^
        email.hashCode ^
        password.hashCode ^
        preferences.hashCode ^
        posts.hashCode ^
        starredPosts.hashCode ^
        avatarUrl.hashCode;
  }
}
