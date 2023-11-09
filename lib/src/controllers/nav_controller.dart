
import 'package:flutter/material.dart';

class NavController extends ChangeNotifier{
  int _indexSatckPage = 0;
   
  int get indexStackPage => _indexSatckPage;
  set indexStackPage(int valor){
    _indexSatckPage = valor;
    notifyListeners();
  } 
}