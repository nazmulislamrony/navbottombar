import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({Key? key}) : super(key: key);

  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final controllerTo = TextEditingController();
  final controllerSubject = TextEditingController();
  final controllerMessage = TextEditingController();

  bool _validateTo = false;
  bool _validateSubject = false;
  bool _validateMessage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: (Text("Form")),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildTextField(
                title: 'To',
                controller: controllerTo,
                validateTxt: _validateTo,
                maxLine: 1),
            SizedBox(
              height: 15.0,
            ),
            buildTextField(
                title: 'Subject',
                controller: controllerSubject,
                validateTxt: _validateSubject,
                maxLine: 1),
            SizedBox(
              height: 15.0,
            ),
            buildTextField(
                title: 'Body',
                controller: controllerMessage,
                validateTxt: _validateMessage,
                maxLine: 3),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (controllerSubject.text.isEmpty) {
                      _validateSubject = true;
                    } else {
                      _validateSubject = false;
                    }
                    if (controllerMessage.text.isEmpty) {
                      _validateMessage = true;
                    } else {
                      _validateMessage = false;
                    }
                    // send mail if both field is not empty
                    if (controllerSubject.text.isNotEmpty &&
                        controllerMessage.text.isNotEmpty) {
                      _openMailLauncher(
                          toEmil: controllerTo.text,
                          toSubject: controllerSubject.text,
                          message: controllerMessage.text);
                    }
                  });
                },
                child: const Text("Send")),
            const SizedBox(
              height: 100,
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    const Expanded(
                      child: Text(
                        "Note: When we get your mail, we will contact you through the mail.",
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
                        overflow: TextOverflow.visible,
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }

  Widget buildTextField(
      {required String title,
      required TextEditingController controller,
      required bool validateTxt,
      required int maxLine}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        TextField(
          controller: controller,
          maxLines: maxLine,
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              errorText: validateTxt ? 'Value Can\'t be Empty' : null),
        )
      ],
    );
  }
}

Future _openMailLauncher(
    {required String toEmil,
    required String toSubject,
    required String message}) async {
  final url =
      'mailto: $toEmil? subject=${Uri.encodeFull(toSubject)} &body =${Uri.encodeFull(message)}';

  if (await canLaunch(url)) {
    await launch(url);
  }
}
