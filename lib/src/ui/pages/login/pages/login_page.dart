import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mas_uno_test/src/data/apis/auth_service.dart';
import 'package:mas_uno_test/src/domain/controllers/profile_controller.dart';
import 'package:mas_uno_test/src/ui/pages/login/widgets/button_sign_login_widget.dart';
import 'package:mas_uno_test/src/ui/pages/principal/pages/principal_page.dart';
import 'package:mas_uno_test/src/ui/widgets/text_app_widget.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final profileController = Provider.of<ProfileController>(context);

    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const TextWidgetApp(
                text: "Mas sobre las películas",
                size: 22.0,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.center,
                colorText: Colors.black),
            SizedBox(
              height: size.height*0.30,
            ),
            ButtonSignLogin(
              action: () async{
                //*se encuentra implementado al 80%
                AuthService().signInWithGoogle();
                showDialog(
                  context: context, 
                  builder: (context){
                  return AlertDialog(
                    content: Container(
                      height: 80.0,width: 80.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0)
                      ),
                      child:const Center(
                        child: CircularProgressIndicator(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  );
                });
                await Future.delayed(const Duration(milliseconds: 300));
                profileController.textEditingControllerEmail = TextEditingController(text: "");
                profileController.textEditingControllerLastName = TextEditingController(text: "");
                profileController.textEditingControllerName = TextEditingController(text: "");

                // ignore: use_build_context_synchronously
                Navigator.pop(context);

                // ignore: use_build_context_synchronously
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const PrincipalStackPage()));
              },
              colorbutton: Colors.white,
              iconData: FontAwesomeIcons.google,
              labelButton: "Iniciar con Gmail",
              size: size),  
            const SizedBox(height: 20.0),          
            //ButtonSignLogin(
            //  action: (){},
            //  colorbutton: Colors.white,
            //  iconData: FontAwesomeIcons.facebook,
            //  labelButton: "Iniciar con Gmail",
            //  size: size)
          ],
        ),
      ),
    );
  }
}
