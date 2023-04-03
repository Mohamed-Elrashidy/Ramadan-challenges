import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  final String category;
  const CategoryWidget({required this.category});

  @override
  Widget build(BuildContext context) {
    return   Container(
      padding:
      EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.blue),
      child: Text(category,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white)),
    );
  }
}
