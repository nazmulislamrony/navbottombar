import 'package:flutter/cupertino.dart';
import 'package:untitled/paidcourse/model/playlist_iteam_model.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:http/http.dart' as http;


class YoutubeApiProvider extends ChangeNotifier {
  YoutubePlayerController? controller;
  YoutubePlaylistiteam? youtubePlaylistiteam;
  bool loading = false;

  Future getCourseItemPlayList(String courseId, int maxResult) async {
    loading = true;
    String url =
        // "https://www.googleapis.com/youtube/v3/playlistItems?playlistId=PLva00o2KamYwKsBessoEFYRxHKIuVO4kb&key=AIzaSyCNc-j6dND2JR4TZLCCvFGa-upvOZCTXLM&part=snippet&maxResults=100&fields=items(id,snippet(title,channelTitle,resourceId(videoId)))";
        "https://www.googleapis.com/youtube/v3/playlistItems?playlistId=${courseId}&key=AIzaSyCNc-j6dND2JR4TZLCCvFGa-upvOZCTXLM&part=snippet&maxResults=${maxResult}&fields=items(id,snippet(title,channelTitle,resourceId(videoId)))";
    var response = await http.get(Uri.parse(url));
    if(response.statusCode==200) {
      youtubePlaylistiteam = youtubePlaylistiteamFromJson(response.body);
      loading = false;
      notifyListeners();
    }
  }

  runyoutubevideo(String videoid) {
    controller = YoutubePlayerController(
      initialVideoId: videoid,
      params: const YoutubePlayerParams(
        autoPlay: true,
        showControls: true,
        showFullscreenButton: true,
        desktopMode: false,
        privacyEnhanced: false,
        useHybridComposition: false,
      ),
    );

  }
}
