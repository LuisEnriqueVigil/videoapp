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
        (isActive == false) ?
          Icon(
            icon,
            size: 30.0,
            color: (isActive)? Colors.deepPurple: Colors.black,
          ):
          Container(
            width: 40.0,height: 40.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.deepPurple.withOpacity(0.30)
            ),
            child: Icon(
              icon,
              size: 30.0,
              color: (isActive)? Colors.deepPurple: Colors.black,
            ),
          ),
        Text(
          label,
          style: TextStyle(
            fontSize: 10.0,
            color: (isActive)?  Colors.deepPurple: Colors.black,
            fontWeight: FontWeight.normal,
          ),
        )
      ],
    );
  }
}
