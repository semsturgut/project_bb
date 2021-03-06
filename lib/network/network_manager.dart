import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:project_bb/models/comic.dart';
import 'package:project_bb/services/api_response_status.dart';

class NetworkManager {
  static final NetworkManager _singleton = NetworkManager._internal();

  factory NetworkManager() => _singleton;

  static NetworkManager get instance => _singleton;
  http.Client client;
  static int timeOutSeconds = 15;

  static String baseURL;
  void prpUrls() => baseURL = 'https://xkcd.com/';

  NetworkManager._internal() {
    client = http.Client();
    prpUrls();
  }

  static final String infoURL = 'info.0.json';
  static final String latestComicURL = baseURL + infoURL;

  Future<dynamic> getLatestComic() async {
    http.Response response = await doGet(url: latestComicURL);
    final body = jsonDecode(response.body);
    ApiResponseStatus apiResponseStatus =
        _responseStatusConverter(statusCode: response.statusCode);
    return Comic.fromJson(body, apiResponseStatus);
  }

  Future<Comic> getComicFromNumber({int number}) async {
    http.Response response =
        await doGet(url: baseURL + number.toString() + '/' + infoURL);
    Map<String, dynamic> body = Map<String, dynamic>();
    Comic _comic = Comic();
    ApiResponseStatus apiResponseStatus;
    try {
      apiResponseStatus = _responseStatusConverter(
          statusCode: response.statusCode, control: false);
      body = jsonDecode(response.body);
      _comic = Comic.fromJson(body, apiResponseStatus);
    } catch (e) {
      _comic = Comic(
        img: "",
        title: handleBaseResponseWithString(apiResponseStatus),
        // number: number - 99, // Crash test - 1
        number: number,
        alt: e.toString(),
        responseStatus: apiResponseStatus,
      );
    }
    return _comic;
  }

  ApiResponseStatus _responseStatusConverter(
      {int statusCode, bool control = true}) {
    ApiResponseStatus apiResponseStatus =
        handleApiStatusWithBaseResponse(statusCode);

    /// This will handle all response status codes and throw as a exception
    if (apiResponseStatus != ApiResponseStatus.successful && control)
      throw apiResponseStatus;

    return apiResponseStatus;
  }

  Future<http.Response> doGet(
      {String url, Map<String, String> queryParameters}) async {
    Map<String, String> header = {'Content-Type': 'application/json'};
    final parsedUrl = Uri.parse(url).replace(queryParameters: queryParameters);
    http.Response response;
    try {
      response = await NetworkManager.instance.client
          .get(parsedUrl, headers: header)
          .timeout(Duration(seconds: timeOutSeconds));
    } on SocketException {
      /// Generic response checker for no connection
      throw ApiResponseStatus.noConnection;
    } on Exception {
      /// Generic response checker for unexpected errors
      throw ApiResponseStatus.otherError;
    }
    return response;
  }
}
