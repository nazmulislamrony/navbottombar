import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:untitled/youtube/provider/provider_video_course.dart';
import 'package:google_fonts/google_fonts.dart';

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
      appBar: AppBar(
        title: const Text("Video Courses"),
      ),
      // body: CustomScrollView(
      //   slivers: [
      //     SliverAppBar(
      //       pinned: true,
      //       centerTitle: true,
      //       backgroundColor: Colors.indigoAccent,
      //       title: Text("Courses"),
      //     ),
      //     videocourseslist.loading
      //         ? SliverToBoxAdapter(
      //             child: Container(
      //               child: Center(
      //                 child: CircularProgressIndicator(),
      //               ),
      //             ),
      //           )
      //         : SliverGrid(
      //             delegate: SliverChildBuilderDelegate(
      //               (context, index) {
      //                 var booklist = videocourseslist.videoCourseList[index];
      //                 return Container(
      //                   child: Text(booklist.courseName),
      //                 );
      //               },
      //               childCount: videocourseslist.videoCourseList.length,
      //             ),
      //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //                 crossAxisCount: 3, childAspectRatio: 0.98))
      //   ],
      // ),
      body: Container(
        child: videocourseslist.loading
            ? Container(child: Center(child: CircularProgressIndicator()))
            : GridView.count(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 20,
                // mainAxisSpacing: 10,
                crossAxisCount: 3,
                children: List.generate(videocourseslist.videoCourseList.length,
                    (index) {
                  return Container(
                    child: Column(
                      children: [
                        gridContainer(
                            coursePrice: videocourseslist
                                .videoCourseList[index].coursePrice,
                            onTap: () {},
                            courseName: videocourseslist
                                .videoCourseList[index].courseName)
                      ],
                    ),
                  );
                })),
      ),
    );
  }

  Widget gridContainer(
      {String? courseName, String? coursePrice, GestureTapCallback? onTap}) {
    return Container(
      width: double.infinity,
      height: 80,
      alignment: Alignment.center,
      padding: EdgeInsets.all(7),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.shade200,
          blurRadius: 5.0,
          // has the effect of softening the shadow
          spreadRadius: 2.0,
          offset: Offset(
            1.0, // horizontal, move right 10
            5.0, // vertical, move down 10
          ),
        )
      ], borderRadius: BorderRadius.circular(5), color: Colors.white),
      child: Stack(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child: Text(courseName.toString(), style: GoogleFonts.lato(fontSize: 10)),
            ),
           SizedBox(height: 5),
            Container(
              alignment: Alignment.center,
              child: Text("৳"+coursePrice.toString(),style: GoogleFonts.lato(fontSize: 10),),
            ),
          ],
        ),
        Container(
          alignment: Alignment.bottomCenter ,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                child:
                Text("Content", style: GoogleFonts.lato(fontSize: 10)),
              ),
              Container(
                child: Text(
                  "Buy",
                  style: GoogleFonts.lato(fontSize: 10),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
