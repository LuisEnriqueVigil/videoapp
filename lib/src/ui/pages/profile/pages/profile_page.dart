import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mas_uno_test/src/domain/controllers/profile_controller.dart';
import 'package:mas_uno_test/src/domain/controllers/sign_in_controller.dart';
import 'package:mas_uno_test/src/domain/models/user/user_model.dart';
import 'package:mas_uno_test/src/ui/pages/profile/widgets/input_profile_info_widget.dart';
import 'package:mas_uno_test/src/ui/widgets/buttons_app_widget.dart';
import 'package:mas_uno_test/src/ui/widgets/text_app_widget.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _isupdatingInfo = false; 

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final profileController = Provider.of<ProfileController>(context);
    final signInControllerApp = Provider.of<SignInControllerApp>(context);

    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.25),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height * 0.08,
                ),
                const CircleAvatar(
                  radius: 40.0,
                  backgroundColor: Colors.black,
                  child: TextWidgetApp(
                      text: "L",
                      size: 14.0,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.center,
                      colorText: Colors.white),
                ),
                const SizedBox(height: 20.0),
                SizedBox(
                  height: 80.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TextWidgetApp(
                          text: "Nombres",
                          size: 14.0,
                          fontWeight: FontWeight.normal,
                          textAlign: TextAlign.start,
                          colorText: Colors.black),
                      const SizedBox(height: 10.0),
                      InputProfileInfo(
                        inputType: "name",
                        initialValue: profileController.textEditingControllerName.text,
                        hintText: "Nombres",
                        textEditingController: profileController.textEditingControllerName,
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                SizedBox(
                  height: 80.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TextWidgetApp(
                          text: "Apellidos",
                          size: 14.0,
                          fontWeight: FontWeight.normal,
                          textAlign: TextAlign.start,
                          colorText: Colors.black),
                      const SizedBox(height: 10.0),
                      InputProfileInfo(
                        inputType: "lastname",
                        initialValue: profileController.textEditingControllerLastName.text,
                        hintText: "Apellidos",
                        textEditingController: profileController.textEditingControllerLastName,
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                SizedBox(
                  height: 80.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TextWidgetApp(
                          text: "Email",
                          size: 14.0,
                          fontWeight: FontWeight.normal,
                          textAlign: TextAlign.start,
                          colorText: Colors.black),
                      const SizedBox(height: 10.0),
                      InputProfileInfo(
                        inputType: "email",
                        initialValue: profileController.textEditingControllerEmail.text,
                        hintText: "Email",
                        textEditingController: profileController.textEditingControllerEmail,
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
                ButtonsAppWidget(
                    onTap: (_isupdatingInfo == true) ? 
                    null 
                    :
                    () async {
                      FocusScope.of(context).unfocus();
                      setState(() {});
                      _isupdatingInfo = true;
                      debugPrint(
                        profileController.textEditingControllerName.text+
                        profileController.textEditingControllerLastName.text+
                        profileController.textEditingControllerEmail.text
                      );
                      String idUserDoc = await signInControllerApp.getToken();
                      bool isUpdate = await updateAndCreateUser(
                          idUser: idUserDoc,
                          email: profileController.textEditingControllerEmail.text, 
                          lastname:  profileController.textEditingControllerLastName.text, 
                          name:  profileController.textEditingControllerName.text
                      );
                      setState(() {});
                      _isupdatingInfo = false;
                      final snackBar =  SnackBar(
                        backgroundColor:(isUpdate == true)? 
                           Colors.green :
                           Colors.red,
                        duration:  const Duration(milliseconds: 1000),
                        content:   TextWidgetApp(
                            text: (isUpdate == true )? 
                              "Información actualizada correctamente 😁":
                              "No se pudo actualizar la información",
                            fontWeight: FontWeight.bold,
                            colorText: Colors.white,
                            textAlign: TextAlign.start,
                            size: 15.0,
                          ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    labelButton: (_isupdatingInfo == false) ?
                      "Actualizar perfil":
                      "Actualizando...",
                    colorButton:((_isupdatingInfo == false))?
                       Colors.purple.withOpacity(0.40):
                       Colors.grey.withOpacity(0.40))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future <bool> updateAndCreateUser({
    required String idUser,
    required String name,
    required String lastname,
    required String email,
  }) async {
    try {
      final docUser = FirebaseFirestore.instance.collection('users').doc(idUser);
      final json = {
        "id":idUser,
        'name': name,
        "lastname": lastname,
        "email": email
      };
      await docUser.set(json);
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  Stream<List<UserModel>> readUsers() => FirebaseFirestore.instance
  .collection('users')
  .snapshots()
  .map((event) => event.docs.map((doc) => UserModel.fromJson(doc.data())).toList());
}
