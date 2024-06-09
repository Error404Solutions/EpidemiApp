import 'package:flutter/material.dart';
import 'package:flutter_application_1/auto/config/menu/menu_item.dart';
import 'package:go_router/go_router.dart';

class SideMenu extends StatefulWidget {

  final GlobalKey<ScaffoldState> scaffoldKey;

  const SideMenu({
    super.key, 
    required this.scaffoldKey
  });

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  
  int navDrawerIndex = 0;
  
  @override
  Widget build(BuildContext context) {

    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;

    

    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (value) {
        setState(() {
          navDrawerIndex = value;
        });

        final menuItem = appMenuItems[value];
        context.push(menuItem.link);
        widget.scaffoldKey.currentState?.closeDrawer();


      },
      children: [

        Padding(
          padding:  EdgeInsets.fromLTRB(28, hasNotch ? 5 : 20, 16, 10),
          child: const Text('Main'),
        ),

        ...appMenuItems
        //.sublist(0,2)
        .map((item) => NavigationDrawerDestination(
          icon: Icon(item.icon), 
          label: Text(item.title)
        ),
        ),

        const Padding(
          padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
          child: Divider(),
        ),


        /* Padding(
          padding:  EdgeInsets.fromLTRB(28, hasNotch ? 5 : 20, 16, 10),
          child: const Text('Secundarias'),
        ),
        
        ...appMenuItems
        //.sublist(0,2)
        .map((item) => NavigationDrawerDestination(
          icon: Icon(item.icon), 
          label: Text(item.title)
        ),
        ), */



      ],
    );
  }
}