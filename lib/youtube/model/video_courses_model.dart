// To parse this JSON data, do
//
//     final modelVideoCourse = modelVideoCourseFromJson(jsonString);

import 'dart:convert';

List<ModelVideoCourse> modelVideoCourseFromJson(String str) => List<ModelVideoCourse>.from(json.decode(str).map((x) => ModelVideoCourse.fromJson(x)));

String modelVideoCourseToJson(List<ModelVideoCourse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelVideoCourse {
  ModelVideoCourse({
    required this.id,
    required this.courseId,
    required this.courseName,
    required this.coursePrice,
  });

  String id;
  String courseId;
  String courseName;
  String coursePrice;

  factory ModelVideoCourse.fromJson(Map<String, dynamic> json) => ModelVideoCourse(
    id: json["id"],
    courseId: json["course_id"],
    courseName: json["course_name"],
    coursePrice: json["course_price"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "course_id": courseId,
    "course_name": courseName,
    "course_price": coursePrice,
  };
}
