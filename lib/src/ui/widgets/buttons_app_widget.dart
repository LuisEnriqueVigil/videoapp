import 'package:flutter/material.dart';
import 'package:mas_uno_test/src/ui/widgets/text_app_widget.dart';

class ButtonsAppWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String labelButton;
  final Color colorButton;
  const ButtonsAppWidget(
      {super.key,
      required this.onTap,
      required this.labelButton,
      required this.colorButton});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return InkWell(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10.0),
          width: size.width * 0.85,
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: colorButton,
          ),
          child: Center(
            child: TextWidgetApp(
                text: labelButton,
                size: 16.0,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.center,
                colorText: Colors.white
             ),
          ),
        ));
  }
}
