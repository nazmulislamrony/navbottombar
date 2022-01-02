import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:untitled/pdf_viewer/pdfviewer_page.dart';

class DownloadButton extends StatefulWidget {
  const DownloadButton({Key? key}) : super(key: key);

  @override
  _DownloadButtonState createState() => _DownloadButtonState();
}

class _DownloadButtonState extends State<DownloadButton> {
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
                  print("click");
                  openFile(
                      url:
                          "https://www.voltagelab.com/wp-content/uploads/2021/12/circuit_hatekhori-1.pdf");
                },
                child: Text("Download and Open"))
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
    final appStorage = await getApplicationDocumentsDirectory();

    final file = File('${appStorage.path}/$name');
    try {
      if (!file.existsSync()) {
        final response = await Dio().get(url,
            options: Options(
                responseType: ResponseType.bytes,
                followRedirects: false,
                receiveTimeout: 0));

        final raf = file.openSync(mode: FileMode.write);
        raf.writeFromSync(response.data);
        await raf.close();
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
