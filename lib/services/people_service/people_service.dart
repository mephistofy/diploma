import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:diploma_v1/models/api/api_error.dart';
import 'package:diploma_v1/models/api/api_response.dart';
import 'package:diploma_v1/constants/constants.dart';

class PeopleService {
  static Future <ApiResponse> getAll() async{
    ApiResponse _apiResponse = new ApiResponse();

    try {
      //post in future
      final response = await http.get(Uri.parse(API_PEOPLE_ALL),
        headers: {
          'content-type': 'application/json',
          'accept': 'application/json',
        },
      );

      final body = jsonDecode(response.body);

      if (body['error'] != null) {
        final statusCode = response.statusCode.toString();
        final error = body['error'];

        _apiResponse.ApiError = ApiError(error: "$statusCode: $error");
      }
      else {
        _apiResponse.Data = body;
      }
    } on SocketException {
      _apiResponse.ApiError = ApiError(error: SOCKET_EXCEPTION);
    } on HttpException {
      _apiResponse.ApiError = ApiError(error: HTTP_EXCEPTION);
    } on FormatException {
      _apiResponse.ApiError = ApiError(error: FORMAT_EXCEPTION);
    }

    return  _apiResponse;
  }
}