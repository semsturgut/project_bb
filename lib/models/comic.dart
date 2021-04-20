import 'package:project_bb/models/base_response.dart';

class Comic extends BaseResponse {
  String month;
  int number;
  String link;
  String year;
  String news;
  String safeTitle;
  String transcript;
  String alt;
  String img;
  String title;
  String day;

  Comic(
      {this.month,
      this.number,
      this.link,
      this.year,
      this.news,
      this.safeTitle,
      this.transcript,
      this.alt,
      this.img,
      this.title,
      this.day});

  Comic.fromJson(Map<String, dynamic> json, int statusCode) {
    if (json["month"] is String) this.month = json["month"];
    if (json["num"] is int) this.number = json["num"];
    if (json["link"] is String) this.link = json["link"];
    if (json["year"] is String) this.year = json["year"];
    if (json["news"] is String) this.news = json["news"];
    if (json["safe_title"] is String) this.safeTitle = json["safe_title"];
    if (json["transcript"] is String) this.transcript = json["transcript"];
    if (json["alt"] is String) this.alt = json["alt"];
    if (json["img"] is String) this.img = json["img"];
    if (json["title"] is String) this.title = json["title"];
    if (json["day"] is String) this.day = json["day"];
    this.statusCode = statusCode;
  }
}
