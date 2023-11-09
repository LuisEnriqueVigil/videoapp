import 'package:flutter/material.dart';

class IconMenuOption extends StatelessWidget {
  final IconData icon; 
  final String label;
  final bool isActive;  

  const IconMenuOption({
    required this.icon,
    required this.label,
    required this.isActive,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 30.0,
          color: (isActive)? Colors.red : Colors.black,
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 10.0,
            color: (isActive)?  Colors.red : Colors.black,
            fontWeight: FontWeight.normal,
          ),
        )
      ],
    );
  }
}
