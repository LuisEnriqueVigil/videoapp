import 'package:flutter/material.dart';
import 'package:mas_uno_test/src/ui/pages/home/pages/home_page.dart';
import 'package:mas_uno_test/src/ui/pages/principal/widgets/icon_menu_page_widget.dart';
import 'package:mas_uno_test/src/ui/pages/profile/pages/profile_page.dart';

class StackPagesForNavigatorBar extends StatelessWidget {
  const StackPagesForNavigatorBar({Key?key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: IndexedStack(
        index: indexPageStackController.indexPage,
        children: const [
          HomePage(), 
          ProfilePage()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int i) async{
          
        },
        currentIndex: indexPageStackController.indexPage,
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