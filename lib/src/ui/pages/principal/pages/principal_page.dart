import 'package:flutter/material.dart';
import 'package:mas_uno_test/src/controllers/nav_controller.dart';
import 'package:mas_uno_test/src/ui/pages/home/pages/home_page.dart';
import 'package:mas_uno_test/src/ui/pages/principal/widgets/icon_menu_page_widget.dart';
import 'package:mas_uno_test/src/ui/pages/profile/pages/profile_page.dart';
import 'package:provider/provider.dart';

class PrincipalStackPage extends StatelessWidget {
  const PrincipalStackPage({Key?key}):super(key: key);

  @override
  Widget build(BuildContext context) {

    final indexPageStackController = Provider.of<NavController>(context);
    
    return Scaffold(
      body: IndexedStack(
        index: indexPageStackController.indexStackPage,
        children: const [
          HomePage(), 
          ProfilePage()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int i) async{
          indexPageStackController.indexStackPage = i;
        },
        currentIndex: indexPageStackController.indexStackPage,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items:const<BottomNavigationBarItem> [
          BottomNavigationBarItem(
            activeIcon: IconMenuOption(
              icon: Icons.store, 
              label: "Home", 
              isActive: true
            ),
            label: "Home",
            icon:  IconMenuOption(
              icon: Icons.store, 
              label: "Home", 
              isActive: false
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: IconMenuOption(
              icon: Icons.dashboard, 
              label: "Profile", 
              isActive: true
            ),
            label: "Profile",
            icon:  IconMenuOption(
              icon: Icons.dashboard, 
              label: "Profile", 
              isActive: false
            ),
          ),
        ],
      )
    );
  }
}