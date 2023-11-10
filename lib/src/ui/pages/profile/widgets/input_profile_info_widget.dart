import 'package:flutter/material.dart';

class InputProfileInfo extends StatelessWidget {
  final String hintText;
  final TextEditingController textEditingController;
  final Function(String) onChanged;
  final String initialValue;
  const InputProfileInfo(
      {Key? key,
      required this.hintText,
      required this.onChanged,
      required this.textEditingController,
      required this.initialValue
    })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: 46.0,
      width: size.width * 0.85,
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.08),
          borderRadius: BorderRadius.circular(5.0),
          border:
              Border.all(color: Colors.black.withOpacity(0.10), width: 1.5)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextFormField(
          controller: textEditingController,
          style: const TextStyle(color: Colors.black),
          onChanged: (valor){
            textEditingController.text = valor;
          },
          textAlign: TextAlign.start,
          autocorrect: false,
          keyboardType: TextInputType.emailAddress,
          cursorColor: Colors.black,
          decoration: InputDecoration.collapsed(
            focusColor: Colors.black,
            hintText: textEditingController.text,
            hintStyle: const TextStyle(color: Colors.black, fontSize: 14.0),
          ),
        ),
      ),
    );
  }
}
