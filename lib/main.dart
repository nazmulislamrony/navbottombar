
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/download_pdf/download_button.dart';
import 'package:untitled/mydrawer.dart';
import 'package:untitled/navdrawerwidget.dart';
import 'package:untitled/paidcourse/provider/provider_video_course.dart';
import 'package:untitled/paidcourse/provider/youtube_paid_course_api_provider.dart';
import 'package:untitled/paidcourse/video_course_list/video_course_list.dart';


void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => ProviderVideoCourse()),
    ChangeNotifierProvider(create: (context) => YoutubeApiProvider()),

  ],
  child: MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DownloadButton(),
    );
  }
}
