enum ApiResponseStatus {
  successful,
  unauthorized,
  notFound,
  badRequest,
  serverError,
  otherError,
  noContent,
  noConnection
}

ApiResponseStatus handleApiStatusWithBaseResponse(int response) {
  if (response >= 200 && response <= 300 && response != 204) {
    return ApiResponseStatus.successful;
  } else if (response >= 400 && response < 404) {
    return ApiResponseStatus.unauthorized;
  } else if (response == 404) {
    return ApiResponseStatus.notFound;
  } else if (response == 422) {
    return ApiResponseStatus.badRequest;
  } else if (response >= 500 && response <= 600) {
    return ApiResponseStatus.serverError;
  } else if (response == 204) {
    return ApiResponseStatus.noContent;
  } else {
    return ApiResponseStatus.otherError;
  }
}

String handleBaseResponseWithString(ApiResponseStatus apiResponseStatus) {
  switch (apiResponseStatus) {
    case ApiResponseStatus.noConnection:
      return 'No Connection';
      break;
    case ApiResponseStatus.serverError:
      return 'Server Error';
      break;
    case ApiResponseStatus.notFound:
      return 'Not Found';
      break;
    case ApiResponseStatus.noContent:
      return 'Not Content';
      break;
    case ApiResponseStatus.otherError:
      return 'Other Error';
      break;
    default:
      return 'Undefined Error';
      break;
  }
}
