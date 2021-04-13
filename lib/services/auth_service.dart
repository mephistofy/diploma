import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:diploma_v1/models/api/api_error.dart';
import 'package:diploma_v1/models/api/api_response.dart';
import 'package:diploma_v1/constants/constants.dart';

class Auth {
  Future <ApiResponse> login(final String login, final String password) async{
    ApiResponse _apiResponse = new ApiResponse();

    try {
      final response = await http.get(Uri.parse(API_LOGIN),
        headers: {
          'content-type': 'application/json',
          'accept': 'application/json',
        },
      );

      _apiResponse.Data = response.body;
      
    } on SocketException {
      _apiResponse.ApiError = ApiError(error: "Нет интернет соединения либо же сервер не доступен 😑");
    } on HttpException {
      _apiResponse.ApiError = ApiError(error: "Не верные данные 😱");
    } on FormatException {
      _apiResponse.ApiError = ApiError(error: "Плохой формат ответа 👎");
    }

    return  _apiResponse;
  }

    Future <ApiResponse> logOut(final String token) async{
    ApiResponse _apiResponse = new ApiResponse();

    try {
      final response = await http.delete(Uri.parse(API_LOGOUT),
        headers: {
          'content-type': 'application/json',
          'accept': 'application/json',
          'authorization': "Bearer: $token", 
        },
      );

      _apiResponse.Data = response.body;
      

    } on SocketException {
      _apiResponse.ApiError = ApiError(error: "Нет интернет соединения либо же сервер не доступен 😑");
    } on HttpException {
      _apiResponse.ApiError = ApiError(error: "Не верные данные 😱");
    } on FormatException {
      _apiResponse.ApiError = ApiError(error: "Плохой формат ответа 👎");
    }

    return  _apiResponse;
  }
}