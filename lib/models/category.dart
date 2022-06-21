import 'package:flutter/material.dart';

class Category {
  final String name;
  final IconData icon;
  final Color backgroundColor;
  final String id;

  Category({
    required this.name,
    required this.icon,
    required this.backgroundColor,
    required this.id,
  });

  static List<Category> categories = [
    Category(
      name: "Top Headlines",
      icon: Icons.newspaper,
      backgroundColor: Colors.redAccent.shade200,
      id: "top-headlines",
    ),
    Category(
      name: "Sports",
      icon: Icons.sports_baseball,
      backgroundColor: Colors.green.shade300,
      id: "sports",
    ),
    Category(
      name: "Entertainment",
      icon: Icons.movie,
      backgroundColor: Colors.orange,
      id: "entertainment",
    ),
    Category(
      name: "Business",
      icon: Icons.business_center,
      backgroundColor: Colors.blueAccent,
      id: "business",
    ),
    Category(
      name: "Science",
      icon: Icons.science_outlined,
      backgroundColor: Colors.brown,
      id: "science",
    ),
    Category(
      name: "Technology",
      icon: Icons.biotech_outlined,
      backgroundColor: Colors.deepPurple,
      id: "technology",
    ),
    Category(
      name: "Health",
      icon:   Icons.health_and_safety_outlined,
      backgroundColor: Colors.amberAccent.shade400,
      id: "health",
    ),
  ];
}
