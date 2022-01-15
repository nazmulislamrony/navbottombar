import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/pdf_viewer/purchase_book/book_order.dart';

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
          paymentItemList(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BookPaymentPage()));
              },
              image: Image.asset(
                'images/bikash.png',
              ),
              name: 'Bkash'),
          paymentItemList(
              image: Image.asset(
                'images/rocket.jpg',
              ),
              name: 'Rocket')
        ],
      ),
    );
  }

  /*
  {GestureTapCallback? onTap, Widget? imagechild, String? name}) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height * 0.08,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          10,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 80,
                    child: imagechild),
              ],
            ),
            const SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 50,
                  child: Text(
                    name!,
                    style: GoogleFonts.hindSiliguri(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
  */
  Widget paymentItemList(
      {GestureTapCallback? onTap, Widget? image, String? name}) {
    return Container(
      height: 100,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3))
            ]),
        child: InkWell(
          onTap: onTap,
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    child: image,
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Text(name.toString()),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
