
import 'package:flutter/material.dart';

class NavController with ChangeNotifier{
  int _indexSatckPage = 0;

  int get indexStackPage => _indexSatckPage;
  set indexStackPage(int valor){
    _indexSatckPage = valor;
    notifyListeners();
  } 
}