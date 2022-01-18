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
    isLoading = true;
    String url =
        "http://api.voltagelab.com/vl-app/pdf_book/input_book_purchase_data.php?api_token=$api_token";
    var response = await http.post(Uri.parse(url), body: jsonEncode({
      "email" : 'email',
      "mobile" : 'mobile',
      "book_id" : "book_id",
      "status" : "status"
    }));
    if(response.statusCode == 200) {
      isLoading = false;
      print("successfully_push");
      // Navigator.pushReplacement(context, newRoute)
    } else {
      print("not push");

    }
  }
}
