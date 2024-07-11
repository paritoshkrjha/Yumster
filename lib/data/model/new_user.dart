// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class NewUserModel {
  final String username;
  final String email;
  final String password;
  final List<String> preferences;
  final String avatarUrl;

  NewUserModel({
    required this.username,
    required this.email,
    required this.password,
    required this.preferences,
    required this.avatarUrl,
  });

  NewUserModel copyWith({
    String? username,
    String? email,
    String? password,
    List<String>? preferences,
    String? avatarUrl,
  }) {
    return NewUserModel(
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      preferences: preferences ?? this.preferences,
      avatarUrl: avatarUrl ?? this.avatarUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'email': email,
      'password': password,
      'preferences': preferences,
      'avatarUrl': avatarUrl,
    };
  }

  factory NewUserModel.fromMap(Map<String, dynamic> map) {
    return NewUserModel(
      username: map['username'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      preferences: List<String>.from((map['preferences'])),
      avatarUrl: map['avatarUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory NewUserModel.fromJson(String source) =>
      NewUserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'NewUserModel(username: $username, email: $email, password: $password, preferences: $preferences, avatarUrl: $avatarUrl)';
  }

  @override
  bool operator ==(covariant NewUserModel other) {
    if (identical(this, other)) return true;

    return other.username == username &&
        other.email == email &&
        other.password == password &&
        listEquals(other.preferences, preferences) &&
        other.avatarUrl == avatarUrl;
  }

  @override
  int get hashCode {
    return username.hashCode ^
        email.hashCode ^
        password.hashCode ^
        preferences.hashCode ^
        avatarUrl.hashCode;
  }
}
