import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class PdfBookPaymentProvider extends ChangeNotifier {
  String api_token =
      "jhsdvcjhasdvjchsdcvjhvhgsdhgfsjhdcvbjshdcvbjsvdcjshdcvjshdfvujhsadvfcjshdcvjhsgfvjhgdcvjshdcvjhcvjshcvjsahcvjshcvjsghcvjsgcvjshgcvjhsgcvhsjcvjhsgcvsjvcjsbcvsjhcvdsjhdfvjsbv";

  bool isLoading = false;

  Future bookPurchaseInputData(
      {required String email,
     required String mobile,
     required String book_id,
      required String status,
      required BuildContext context}) async {
    var box = Hive.box('pdf_book_payment');
    isLoading = true;
    String url =
        "http://api.voltagelab.com/vl-app/pdf_book/input_book_purchase_data.php?api_token=$api_token";
    var response = await http.post(Uri.parse(url), body: jsonEncode({
      "email" : box.get('email'),
      "mobile" : box.get('mobile'),
      "book_id" : box.get("book_id"),
      "status" : box.get("status")
    }));
    if(response.statusCode == 200) {
      isLoading = false;
      print("successfully_push");
      // Navigator.pushReplacement(context, newRoute)
    }
  }
}
