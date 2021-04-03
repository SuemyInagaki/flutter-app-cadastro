import 'package:flutter/material.dart';

class User {
  final String id;
  final String name;
  final String year;
  final String avatar;

  const User({
    this.id,
    @required this.name,
    @required this.year,
    this.avatar,
  });
}
