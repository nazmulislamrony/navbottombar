import 'package:flutter/cupertino.dart';

class YoutubePlayList extends StatefulWidget {
  const YoutubePlayList({Key? key}) : super(key: key);

  @override
  _YoutubePlayListState createState() => _YoutubePlayListState();
}

class _YoutubePlayListState extends State<YoutubePlayList> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


String api_token =
    "jhsdvcjhasdvjchsdcvjhvhgsdhgfsjhdcvbjshdcvbjsvdcjshdcvjshdfvujhsadvfcjshdcvjhsgfvjhgdcvjshdcvjhcvjshcvjsahcvjshcvjsghcvjsgcvjshgcvjhsgcvhsjcvjhsgcvsjvcjsbcvsjhcvdsjhdfvjsbv";


// https://www.googleapis.com/youtube/v3/playlistItems?playlistId=
// PLva00o2KamYwKsBessoEFYRxHKIuVO4kb&key=AIzaSyCNc-j6dND2JR4TZLCCvFGa-upvOZCTXLM&part=snippet&fields=items(id,snippet(title,channelTitle,resourceId(videoId)))