import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/paidcourse/provider/youtube_paid_course_api_provider.dart';
import 'package:untitled/paidcourse/video_course_list/youtube_player.dart';

class YoutubePaidCoursePlayList extends StatefulWidget {
  String playlistId;
  String playlistName;
  int maxresult;

  YoutubePaidCoursePlayList(
      {Key? key,
      required this.playlistId,
      required this.maxresult,
      required this.playlistName})
      : super(key: key);

  @override
  _YoutubePaidCoursePlayListState createState() =>
      _YoutubePaidCoursePlayListState();
}

class _YoutubePaidCoursePlayListState extends State<YoutubePaidCoursePlayList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("stepnext: "+widget.playlistId);
    Provider.of<YoutubeApiProvider>(context, listen: false)
        .getCourseItemPlayList(widget.playlistId, widget.maxresult);
  }

  @override
  Widget build(BuildContext context) {
    final courseProvider = Provider.of<YoutubeApiProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                    height: 500,
                    child: courseProvider.loading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : YoutubePlayerPage(
                            videoid: courseProvider.youtubePlaylistiteam!
                                .items[0].snippet.resourceId.videoId)
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
