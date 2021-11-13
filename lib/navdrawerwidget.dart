import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/contact_us.dart';
import 'package:untitled/drawerhelper.dart';
import 'package:untitled/help_feedback.dart';
import 'package:untitled/selecteddrawer.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class NavigationDrawerWidget extends StatelessWidget {
  const NavigationDrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const padding = EdgeInsets.symmetric(horizontal: 10);
    String imgloc = 'images/vl_logo.png';
    String nameApp = 'Voltage Lab';

    return Drawer(
      child: Material(
        color: Colors.white,
        child: ListView(
          padding: padding,
          children: [
            buildHeader(contxt: context, name: nameApp, images: imgloc),
            const SizedBox(
              height: 10.0,
            ),
            dividerContainer(),
            const SizedBox(
              height: 10.0,
            ),
            buildMenuItem(
              text: 'Home',
              icon: Icons.home,
              onClicked: () => selectedItem(context, 0),
            ),
            const SizedBox(
              height: 10.0,
            ),
            buildMenuItem(
              text: 'Profile',
              icon: Icons.person,
              onClicked: () => selectedItem(context, 1),
            ),
            const SizedBox(
              height: 10.0,
            ),
            buildMenuItem(
              text: 'Subscription',
              icon: Icons.add_alert,
              onClicked: () => selectedItem(context, 2),
            ),
            buildMenuItem(
              text: 'Log Out',
              icon: Icons.logout,
              onClicked: () => selectedItem(context, 3),
            ),
            const SizedBox(
              height: 10.0,
            ),
            buildMenuItem(
              text: 'Contact Us',
              icon: Icons.contact_mail,
              onClicked: () => selectedItem(context, 4),
            ),

            const SizedBox(
              height: 60.0,
            ),
            dividerContainer(),
            // Divider(
            //   color: DrawerHelper.defaultColor,
            // ),

            buildMenuItem(
              text: 'Share',
              icon: Icons.share,
              onClicked: () => selectedItem(context, 5),
            ),
            const SizedBox(
              height: 10.0,
            ),
            buildMenuItem(
              text: 'Help and Feedback',
              icon: Icons.help,
              onClicked: () => selectedItem(context, 6),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem(
      {required String text, required IconData icon, VoidCallback? onClicked}) {
    final hoverColor = Colors.blueAccent;
    return ListTile(
      leading: Icon(
        icon,
        size: 24,
        color: Colors.blue,
      ),
      title: Text(text,
          style:
              GoogleFonts.openSans(fontWeight: FontWeight.bold, fontSize: 17)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int i) {
    Navigator.of(context).pop();
    switch (i) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const PeoplePages(),
        ));
        break;
      case 1:
        final snackBar = SnackBar(content: Text("$i"));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        break;
      case 2:
        final snackBar = SnackBar(content: Text("$i"));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        break;
      case 3:
        final snackBar = SnackBar(content: Text("$i"));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        break;
      case 4:
        final snackBar = SnackBar(content: Text("$i"));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const ContactForm(),
        ));
        break;
      case 5:
        final snackBar = SnackBar(content: Text("$i"));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Share.share("text", subject: "Voltage Lab");
        break;
      case 6:
        final snackBar = SnackBar(content: Text("$i"));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => HelpAndFeedback()));
        break;
    }
  }

  Widget buildHeader({
    required BuildContext contxt,
    required var images,
    required String name,
  }) {
    return Container(
        margin: EdgeInsets.only(top: 30, left: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Column(
                children: [
                  Image.asset(
                    images,
                    height: 50,
                    fit: BoxFit.fill,
                    width: 70,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(name,
                      // style: GoogleFonts.openSans()
                      style: GoogleFonts.balsamiqSans(
                          textStyle: Theme.of(contxt).textTheme.headline6,
                          color: Colors.black87,
                          fontSize: 23,
                          fontWeight: FontWeight.bold))
                ],
              ),
            ),
          ],
        ));
  }

  Widget dividerContainer() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Divider(
        color: DrawerHelper.defaultColor,
      ),
    );
  }
}
