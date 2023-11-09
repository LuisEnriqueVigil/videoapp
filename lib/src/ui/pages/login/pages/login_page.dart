import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mas_uno_test/src/ui/pages/home/pages/home_page.dart';
import 'package:mas_uno_test/src/ui/pages/login/widgets/button_sign_login_widget.dart';
import 'package:mas_uno_test/src/ui/pages/principal/pages/principal_page.dart';
import 'package:mas_uno_test/src/ui/widgets/text_app_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const TextWidgetApp(
                text: "Bienvenido",
                size: 30.0,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.center,
                colorText: Colors.black),
            SizedBox(
              height: size.height*0.30,
            ),
            ButtonSignLogin(
              action: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> PrincipalStackPage()));
              },
              colorbutton: Colors.white,
              iconData: FontAwesomeIcons.google,
              labelButton: "Iniciar con Gmail",
              size: size),  
            const SizedBox(height: 20.0),          
            ButtonSignLogin(
              action: (){},
              colorbutton: Colors.white,
              iconData: FontAwesomeIcons.facebook,
              labelButton: "Iniciar con Gmail",
              size: size)
          ],
        ),
      ),
    );
  }
}
