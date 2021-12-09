import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:untitled/youtube/model/video_courses_model.dart';


class ProviderVideoCourse extends ChangeNotifier {
  String api_token =
      "jhsdvcjhasdvjchsdcvjhvhgsdhgfsjhdcvbjshdcvbjsvdcjshdcvjshdfvujhsadvfcjshdcvjhsgfvjhgdcvjshdcvjhcvjshcvjsahcvjshcvjsghcvjsgcvjshgcvjhsgcvhsjcvjhsgcvsjvcjsbcvsjhcvdsjhdfvjsbv";

  List<ModelVideoCourse> videoCourseList = [];
  bool loading = false;

  Future get_video_courses() async {
    loading = true;
    String url = "http://api.voltagelab.com/vl-app/video_courses/video_courses.php?api_token=$api_token";
    var response = await http.get(Uri.parse(url));
    print("totalresponse1: $loading");
    if(response.statusCode == 200) {
      var jsondata = response.body;
      videoCourseList = modelVideoCourseFromJson(jsondata);
      loading = false;
      print("totalresponse1: $loading");
      notifyListeners();
    } 
  }
}