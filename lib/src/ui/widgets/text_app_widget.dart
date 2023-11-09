import 'package:flutter/material.dart';

class TextWidgetApp extends StatelessWidget {
  final String text;
  final double size; 
  final FontWeight fontWeight;
  final TextAlign textAlign; 
  final Color colorText; 

  const TextWidgetApp({super.key, 
    required this.text, 
    required this.size, 
    required this.fontWeight, 
    required this.textAlign, 
    required this.colorText
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontWeight: fontWeight,
        color: colorText,
      ),
    );
  }
}