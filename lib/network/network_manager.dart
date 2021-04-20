import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project_bb/models/comic.dart';

class NetworkManager {
  static final NetworkManager _singleton = NetworkManager._internal();

  factory NetworkManager() => _singleton;

  static NetworkManager get instance => _singleton;
  http.Client client;
  static int timeOutMinute = 1;

  static String baseURL;
  void prpUrls() => baseURL = 'https://xkcd.com/';

  NetworkManager._internal() {
    client = http.Client();
    prpUrls();
  }

  static final String infoURL = 'info.0.json';
  static final String latestComicURL = baseURL + infoURL;

  Future<Comic> getLatestComic() async {
    http.Response response = await doGet(url: latestComicURL);
    final body = jsonDecode(response.body);
    // developer.log(body.toString(), name: 'Response');
    return Comic.fromJson(body, response.statusCode);
  }

  Future<Comic> getComicFromNumber({int number}) async {
    http.Response response =
        await doGet(url: baseURL + number.toString() + '/' + infoURL);
    final body = jsonDecode(response.body);
    // developer.log(body.toString(), name: 'Response');
    return Comic.fromJson(body, response.statusCode);
  }

  Future<http.Response> doGet(
      {String url, Map<String, String> queryParameters}) async {
    Map<String, String> header = {
      'Content-Type': 'application/json',
    };
    final parsedUrl = Uri.parse(url).replace(queryParameters: queryParameters);
    // developer.log(parsedUrl.toString(), name: 'Request Url');
    return await NetworkManager.instance.client
        .get(
          parsedUrl,
          headers: header,
        )
        .timeout(Duration(minutes: timeOutMinute));
  }
}
