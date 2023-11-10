import 'package:flutter/material.dart';
import 'package:mas_uno_test/src/domain/controllers/profile_controller.dart';
import 'package:provider/provider.dart';

class InputProfileInfo extends StatelessWidget {
  final String hintText;
  final TextEditingController textEditingController;
  final String initialValue;
  final String inputType; 
  const InputProfileInfo(
      {Key? key,
      required this.inputType,
      required this.hintText,
      required this.textEditingController,
      required this.initialValue
    })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final profileController = Provider.of<ProfileController>(context);

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
          controller: (inputType == "email") ?
            profileController.textEditingControllerEmail:
            (inputType == "name")?
            profileController.textEditingControllerName:
            profileController.textEditingControllerLastName,
          style: const TextStyle(color: Colors.black),
          onChanged: (inputType == "email") ?
            (valor){
              profileController.email = valor; 
            }:
            (inputType == "name")?
            (valor){
              profileController.name = valor; 
            }:
            (valor){
              profileController.lastName = valor; 
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
