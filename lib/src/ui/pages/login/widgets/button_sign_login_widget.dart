import 'package:flutter/material.dart';
import 'package:mas_uno_test/src/ui/widgets/text_app_widget.dart';

class ButtonSignLogin extends StatelessWidget {
  final String labelButton;
  final Color colorbutton;
  final VoidCallback action;
  final IconData iconData;

  const ButtonSignLogin({
    super.key,
    required this.size,
    required this.labelButton,
    required this.colorbutton,
    required this.action,
    required this.iconData,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: action,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: size.width * 0.15),
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 2.0,
                  blurRadius: 10.0,
                  offset: const Offset(-1, 2))
            ],
            borderRadius: BorderRadius.circular(10.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Icon(
             iconData,
            ),
            const SizedBox(
              width: 30.0,
            ),
            TextWidgetApp(
                text: labelButton,
                size: 14.0,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.start,
                colorText: Colors.black)
          ],
        ),
      ),
    );
  }
}
