import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:untitled/pdf_viewer/pdfviewer_page.dart';
import 'package:untitled/pdf_viewer/purchase_book/payment_list.dart';

class DownloadButton extends StatefulWidget {
  const DownloadButton({Key? key}) : super(key: key);

  @override
  _DownloadButtonState createState() => _DownloadButtonState();
}

class _DownloadButtonState extends State<DownloadButton> {
  String downloadMessage = "downloading_initialize...";
  bool isDownloading = false;
  bool downloading = false;
  double _percentage = 0;
  String progress = '0';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 32,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    isDownloading = !isDownloading;
                  });
                  print("click");
                  openFile(
                      url:
                          "https://www.voltagelab.com/wp-content/uploads/2021/12/circuit_hatekhori-1.pdf");
                },
                child: Text("Download and Open")),
            Text("Downloading Number: $downloadMessage"),
            Text('$progress%'),
            LinearProgressIndicator(
                value: double.parse(_percentage.toString())),
            isDownloading
                ? Text(
                    'File Downloaded! You can see your file in the application\'s directory',
                  )
                : Text('Click the FloatingActionButton to start Downloading!'),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PaymentList()),
                  );
                },
                child: Text("Payment List"))
          ],
        ),
      ),
    );
  }

  Future openFile({required String url}) async {
    final fileName = url.split('/').last;
    final file = await downloadFile(url, fileName);
    if (file == null) return;
    print('Path: ${file.path}');
    openPDF(context, file);
    // OpenFile.open(file.path);
  }

  // Download file into private folder not visible to user
  Future<File?> downloadFile(String url, String name) async {
    setState(() {
      downloading = true;
    });
    final appStorage = await getApplicationDocumentsDirectory();
    final file = File('${appStorage.path}/$name');
    try {
      if (!file.existsSync()) {
        // final response = await Dio().get(url,
        //     options: Options(
        //         responseType: ResponseType.bytes,
        //         followRedirects: false,
        //         receiveTimeout: 0));
        //
        // final raf = file.openSync(mode: FileMode.write);
        // raf.writeFromSync(response.data);
        // await raf.close();

        Dio dio = Dio();
        dio.download(url, file.path, onReceiveProgress: (rcv, total) {
          setState(() {
            progress = ((rcv / total) * 100).toStringAsFixed(0);
            var dd = rcv / total * 100;
            _percentage = dd / 100;
          });
          if (progress == 100) {
            setState(() {
              isDownloading = true;
            });
          } else if (double.parse(progress) < 100) {}
        }, deleteOnError: true).then((_) {
          setState(() {
            if (progress == 100) {
              isDownloading = true;
            }
            downloading = false;
          });
        });

        return file;
      } else {
        return file;
      }
    } catch (e) {
      return null;
    }
  }

  void openPDF(BuildContext context, File file) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => PDFViewerPage(file: file)));
  }
}
