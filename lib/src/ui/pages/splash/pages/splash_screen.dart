import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mas_uno_test/src/domain/controllers/profile_controller.dart';
import 'package:mas_uno_test/src/domain/models/user/user_model.dart';
import 'package:mas_uno_test/src/ui/pages/login/pages/login_page.dart';
import 'package:mas_uno_test/src/ui/pages/principal/pages/principal_page.dart';
import 'package:mas_uno_test/src/ui/widgets/text_app_widget.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

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
                  text: "The MoviesApp",
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

  Future checkLogin (BuildContext context) async{//}
    final profileController  = Provider.of<ProfileController>(context,listen: false);
    
    await Future.delayed(const Duration(seconds: 2));
    
    UserModel? userModel =  await readUser("my_id");

    if(userModel?.name != "name"){

      profileController.textEditingControllerEmail.text = (userModel??UserModel(name: "name", lastname: "lastname", email: "email")).email;
      profileController.textEditingControllerLastName.text = (userModel??UserModel(name: "name", lastname: "lastname", email: "email")).lastname;
      profileController.textEditingControllerName.text = (userModel??UserModel(name: "name", lastname: "lastname", email: "email")).name;

      // ignore: use_build_context_synchronously
      return Navigator.pushReplacement(
        context, PageRouteBuilder(
        pageBuilder: (_,__,___)=>const  PrincipalStackPage(),
        transitionDuration: const Duration(milliseconds: 0)
      ));
    } 
    else if (userModel?.name == "name"){
        // ignore: use_build_context_synchronously
        return Navigator.pushReplacement(
        context, PageRouteBuilder(
        pageBuilder: (_,__,___)=>const  LoginPage(),
        transitionDuration: const Duration(milliseconds: 0)
      ));
    }
    else{
        // ignore: use_build_context_synchronously
      return Navigator.pushReplacement(
        context, PageRouteBuilder(
        pageBuilder: (_,__,___)=>const  LoginPage(),
        transitionDuration: const Duration(milliseconds: 0)
      ));
    }

  }

  
    Future<UserModel?> readUser(String id) async{
      final docUser = FirebaseFirestore.instance.collection('users').doc('my-id');
      final snapshot = await docUser.get();
      if(snapshot.exists){
        return UserModel.fromJson(snapshot.data()!);
      }
      else{
        return UserModel(name: "name", lastname: "lastname", email: "email");
      }
    }
}