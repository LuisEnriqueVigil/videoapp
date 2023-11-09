import 'package:flutter/material.dart';
import 'package:mas_uno_test/src/ui/pages/profile/widgets/input_profile_info_widget.dart';
import 'package:mas_uno_test/src/ui/widgets/buttons_app_widget.dart';
import 'package:mas_uno_test/src/ui/widgets/text_app_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
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
                        hintText: "Nombres",
                        onChanged: (valor) {},
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
                        hintText: "Apellidos",
                        onChanged: (valor) {},
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
                        hintText: "Email",
                        onChanged: (valor) {},
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
                ButtonsAppWidget(
                    onTap: (){},
                    labelButton: "Actualizar perfil",
                    colorButton: Colors.purple.withOpacity(0.40)
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
