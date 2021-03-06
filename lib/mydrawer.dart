import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/contact_us.dart';
import 'package:untitled/drawerhelper.dart';
import 'package:untitled/homepage.dart';
import 'package:untitled/navdrawerwidget.dart';
import 'package:google_fonts/google_fonts.dart';

class MyNavigationDrawer extends StatefulWidget {
  const MyNavigationDrawer({Key? key}) : super(key: key);

  @override
  _MyNavigationDrawerState createState() => _MyNavigationDrawerState();
}

class _MyNavigationDrawerState extends State<MyNavigationDrawer> {
  int _currentIndex = 0;
  final screens = [ContactForm(), MyHomePage(title: "hello")];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        title: const Text("Home"),
      ),
      // body: Center(
      //   child: Text(
      //     "$_currentIndex",
      //     style: const TextStyle(
      //         color: Colors.black, fontSize: 120, fontWeight: FontWeight.bold),
      //   ),
      // ),
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 16,
        unselectedFontSize: 12,
        selectedLabelStyle: TextStyle(fontFamily: 'Hind Siliguri'),
        iconSize: 30,
        selectedItemColor: DrawerHelper.defaultColor,
        unselectedItemColor: Colors.black,
        // fixedColor: Colors.white,

        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: DrawerHelper.defaultColor,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_alert,
              color: DrawerHelper.defaultColor,
            ),
            label: 'Subscription',

            // backgroundColor: Colors.blue
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: DrawerHelper.defaultColor,
            ),
            label: 'Profile',
            // backgroundColor: Colors.red
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.contact_support,
              color: DrawerHelper.defaultColor,
            ),
            label: 'Contact',
            // backgroundColor: Colors.blue
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.home),
          //   label: 'Home',
          //   // backgroundColor: Colors.blue
          // )
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
