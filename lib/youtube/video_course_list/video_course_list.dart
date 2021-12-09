import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/youtube/provider/provider_video_course.dart';

class VideoCourseList extends StatefulWidget {
  const VideoCourseList({Key? key}) : super(key: key);

  @override
  _VideoCourseListState createState() => _VideoCourseListState();
}

class _VideoCourseListState extends State<VideoCourseList> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<ProviderVideoCourse>(context, listen: false)
        .get_video_courses();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final videocourseslist = Provider.of<ProviderVideoCourse>(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            centerTitle: true,
            backgroundColor: Colors.indigoAccent,
            title: Text("Courses"),
          ),
          videocourseslist.loading
              ? SliverToBoxAdapter(
                  child: Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                )
              : SliverGrid(



                  delegate: SliverChildBuilderDelegate((context, index) {
                    print("daaaaaaaaaaaaaaaaaaaffg");
                    var booklist = videocourseslist.videoCourseList[index];
                    return Container(

                      child: Text(booklist.courseName),
                    );
                  },                     childCount: videocourseslist.videoCourseList.length,
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.98
                  ))
        ],
      ),
    );
  }
}
