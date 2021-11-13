import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/navdrawerwidget.dart';

class PeoplePages extends StatelessWidget {
  const PeoplePages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hello"),
      ),
      drawer: const NavigationDrawerWidget(),
    );
  }
}
