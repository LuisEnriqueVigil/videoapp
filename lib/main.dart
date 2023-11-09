import 'package:flutter/material.dart';
import 'package:mas_uno_test/src/controllers/nav_controller.dart';
import 'package:mas_uno_test/src/ui/pages/login/pages/login_page.dart';
import 'package:provider/provider.dart';
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[
        ChangeNotifierProvider(create: (_)=> NavController()),
      ],
      child: const MaterialApp(
        title: 'Material App',
        home: LoginPage()
      ),
    );
  }
}