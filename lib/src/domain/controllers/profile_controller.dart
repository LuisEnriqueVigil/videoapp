import 'package:flutter/material.dart';

class ProfileController with ChangeNotifier{
  String _name = "";
  String _lastName = ""; 
  String _email = "";
  TextEditingController _textEditingControllerName = TextEditingController(
    text: ""
  );
  TextEditingController _textEditingControllerLastName = TextEditingController(
    text: ""
  );
  TextEditingController _textEditingControllerEmail = TextEditingController(
    text: ""
  );


  String get name => _name;
  set name ( String valor){
    _name = valor;
    notifyListeners();
  }
  String get lastName => _lastName;
  set lastName ( String valor){
    _lastName = valor;
    notifyListeners();
  }
  String get email => _email;
  set email ( String valor){
    _email = valor;
    notifyListeners();
  }
  TextEditingController get textEditingControllerEmail => _textEditingControllerEmail;
  set textEditingControllerEmail ( TextEditingController valor){
    _textEditingControllerEmail = valor;
    notifyListeners();
  }
  TextEditingController get textEditingControllerName => _textEditingControllerName;
  set textEditingControllerName ( TextEditingController valor){
    _textEditingControllerName = valor;
    notifyListeners();
  }
  TextEditingController get textEditingControllerLastName => _textEditingControllerLastName;
  set textEditingControllerLastName ( TextEditingController valor){
    _textEditingControllerLastName = valor;
    notifyListeners();
  }
  
}