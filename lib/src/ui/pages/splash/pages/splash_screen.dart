import 'package:flutter/material.dart';
import 'package:mas_uno_test/src/ui/widgets/text_app_widget.dart';

class InitValidationLoginPage extends StatefulWidget {
  const InitValidationLoginPage({Key? key}) : super(key: key);

  @override
  State<InitValidationLoginPage> createState() => _InitValidationLoginPageState();
}

class _InitValidationLoginPageState extends State<InitValidationLoginPage> {

  @override
  void initState() {
    checkLogin(context); 
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: //FutureBuilder(
        //future: checkLogin(context),
        //builder: (context, snapshot) {
        //return 
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:const  [
              Icon(
                Icons.movie,
                size: 50.0,
                color: Colors.white,
              ),
              TextWidgetApp( 
                  text: "Bienvenido a",
                  size: 16.0,
                  fontWeight: FontWeight.normal,
                  colorText: Colors.white,
                  textAlign: TextAlign.start
              ),
              SizedBox(height: 5.0),
              TextWidgetApp(
                  text: "TomaPedidos",
                  size: 18.0,
                  fontWeight: FontWeight.bold,
                  colorText: Colors.white,
                  textAlign: TextAlign.start
              ),
            ],
           ))
          );
        //);
      //}),
    //); 
  }
}