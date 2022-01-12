import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentList extends StatelessWidget {
  const PaymentList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        elevation: 0,
        title: Text(
          'পেমেন্ট অপশন',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
