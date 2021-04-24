import 'package:project_bb/services/api_response_status.dart';

abstract class BaseResponse {
  ApiResponseStatus responseStatus;
  BaseResponse({this.responseStatus});
}
