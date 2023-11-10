import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SignInControllerApp with ChangeNotifier{

  String _idUser = "0"; 

  String get idUser =>_idUser; 
  set idUser(String valor){
    _idUser = valor;
    notifyListeners();
  }

  final _storage = const FlutterSecureStorage();
  //¨save firestore ID 
  Future saveToken (String token) async{
    return await _storage.write(key: "token", value: token); 
  }

  //*TRAYENDO TOKEN
  Future<String> getToken() async{
    try {
      final token    = await _storage.read(key: "token"); 
      return token?? "closeSesion";
    } catch (e) {
      return "closeSesion";
    }
  }
}