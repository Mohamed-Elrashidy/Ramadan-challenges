import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final String title;
  const TitleWidget(

  {
required this.title
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white),
    );
  }
}
