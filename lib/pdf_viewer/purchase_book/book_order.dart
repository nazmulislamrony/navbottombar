import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:untitled/pdf_viewer/purchase_book/book_payment_provider.dart';

class BookPaymentPage extends StatefulWidget {
  const BookPaymentPage({Key? key}) : super(key: key);

  @override
  _BookPaymentPageState createState() => _BookPaymentPageState();
}

class _BookPaymentPageState extends State<BookPaymentPage> {
  String paymentNumbr = "";

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<PdfBookPaymentProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String bookId = "1";
    String mobileNumber = "017";
    String transactionId = "jh2";
    return Scaffold(
        appBar: AppBar(
          title: Text("Pay Now"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                // margin: const EdgeInsets.all(10),
                child: Text(
                  'অর্ডার বিস্তারিত',
                ),
              ),
              const Divider(),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'আইটেম সমূহ',
                    ),
                  ),
                  const Spacer(),
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'সর্বমোট',
                      )),
                ],
              ),
              const Divider(),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'বইয়ের নাম',
                    ),
                  ),
                  const Spacer(),
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text('৳250')),
                ],
              ),
              const Divider(),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'সর্বমোট',
                    ),
                  ),
                  const Spacer(),
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text('৳500')),
                ],
              ),
              const Divider(),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      ' চার্জ',
                    ),
                  ),
                  const Spacer(),
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: const Text('৳0')),
                ],
              ),
              const Divider(),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'সর্বমোট',
                    ),
                  ),
                  const Spacer(),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        '৳60',
                      )),
                ],
              ),
              const Divider(),
              const SizedBox(height: 20),
              Container(child: paymentProcess(contx: context))
            ],
          ),
        ));
  }

  Widget paymentProcess({BuildContext? contx}) {
    return Container(
      child: Column(
        children: [
          Container(
              height: 50,
              alignment: Alignment.center,
              child: Text(
                'পেমেন্ট পদ্ধতি',
              )),
          Container(
            padding: EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "> সর্বপ্রথম পেমেন্ট সম্পন্ন করুন (Send Money)",
                ),
                Text(
                  "> নিচের ফর্মটি পূরণ করুন",
                ),
                Text(
                  "> সাবমিট বাটনে ক্লিক করুন",
                ),
                Text(
                  "> পেমেন্ট ও সবকিছু ঠিক থাকলে ২৪ ঘন্টার ভেতর সাবস্ক্রিপশন একটিভ হবে",
                ),
                Text(
                  "> ২৪ ঘন্টার ভেতর একটিভ না হলে আমাদের সাথে যোগাযোগ করুন এপের যোগাযোগ পেইজ থেকে",
                ),
              ],
            ),
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(5),
                child: Text(
                  "Send Money: 01713509349",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              IconButton(
                  onPressed: () {
                    Clipboard.setData(new ClipboardData(text: "01713509349"))
                        .then((_) {
                      ScaffoldMessenger.of(contx!).showSnackBar(
                          SnackBar(content: Text("01713509349 Copied")));
                    });
                  },
                  icon: Icon(
                    Icons.content_copy_rounded,
                    size: 30,
                  )),
            ],
          ),
          Container(
            child: insertTransactionTxt(),
          ),
          ElevatedButton(
              onPressed: () {
                paySubmit(context);
              },
              child: Text("SUBMIT"))
        ],
      ),
    );
  }

  Widget insertTransactionTxt() {
    return Container(
      margin: EdgeInsets.only(left: 5),
      child: Row(
        children: [
          Container(child: Text("Rocket Number:")),
          SizedBox(
            width: 10,
          ),
          Container(
            width: 180,
            child: TextFormField(
              initialValue: "01",
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: "insert payment number",
                border: OutlineInputBorder(),
                alignLabelWithHint: true,
                contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 10),
                enabled: true,
              ),
              onChanged: (val) {
                setState(() {
                  paymentNumbr = val;
                });
              },
            ),
          )
        ],
      ),
    );
  }

  paySubmit(BuildContext context) {
   var insert = Provider.of<PdfBookPaymentProvider>(context, listen: false);

   insert.bookPurchaseInputData(email: "email", mobile: "mobile", book_id: "book_id", status: "status", context: context);
  }

/*                     child: TextFormField(

            Container(
              margin: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Text('${widget.payment_name} number'),
                  Flexible(
                    child: Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      child: TextFormField(
                        onSaved: (newValue) {
                          setState(() {
                            phone_number = newValue;
                          });
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "${widget.payment_name} number";
                          }
                        },
                        onChanged: (value) {
                          setState(() {
                            phone_number = value;
                          });
                        },
                        initialValue: "01",
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: '${widget.payment_name} number',
                          border: const OutlineInputBorder(),
                          alignLabelWithHint: true,
                          contentPadding:
                              const EdgeInsets.fromLTRB(10, 0, 0, 10),
                          enabled: true,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Row(
                children: [
                  Text('${widget.payment_name} Transaction ID'),
                  Flexible(
                    child: Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      child: TextFormField(
                        onSaved: (newValue) {
                          setState(() {
                            transaction_Id = newValue;
                          });
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter your ${widget.payment_name} Transaction ID";
                          }
                        },
                        onChanged: (value) {
                          setState(() {
                            transaction_Id = value;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: '${widget.payment_name} Transaction ID',
                          border: const OutlineInputBorder(),
                          alignLabelWithHint: true,
                          contentPadding:
                              const EdgeInsets.fromLTRB(10, 0, 0, 10),
                          enabled: true,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: payment.isloading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ElevatedButton(
                      onPressed: () {
                        validationchack(context);
                      },
                      child: const Text('Submit')),

            )
          ],
        ),
      ),
    );
  }
*/
}
