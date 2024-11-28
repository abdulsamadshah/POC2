import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../Utils/Constants/widget_constant.dart';
import '../Model/error_model.dart';
import 'api_execption.dart';

// Jsoncontent type declaration
const String jsonContentType = 'application/json';

///
/// This class contain the Comman methods of API
///
class ApiManager {
  ///
  /// Replace base url with this
  ///
  static const String baseUrl = "https://idealake.com";

  ///
  /// This method is used for call API for the `GET` method, need to pass API Url endpoint
  ///
  Future<dynamic> get(String url, {bool isLoaderShow = true}) async {
    try {
      if (isLoaderShow) {
        EasyLoading.show(maskType: EasyLoadingMaskType.black);
      }

      ///
      /// Declare the header for the request
      ///
      Map<String, String> header = {
        "Authorization": "Token token_value",
        'Content-Type': 'application/json',
      };

      Get.printInfo(info: 'Header - ${header.toString()}');
      Get.printInfo(info: 'GET_URL_CALLED - ${baseUrl + url}');

      ///
      /// Make get method api call
      ///
      final response =
          await http.get(Uri.parse(baseUrl + url), headers: header);

      ///
      /// Handle response and errors
      ///
      var responseJson = _returnResponse(response);
      return responseJson;
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } finally {
      if (isLoaderShow) {
        EasyLoading.dismiss();
      }
    }
  }

  ///
  /// This method is used for call API for the `POST` method, need to pass API Url endpoint
  ///
  Future<dynamic> post(String url, var parameters,
      {String objcontentType = jsonContentType,
      bool isLoaderShow = true,
      bool isErrorSnackShow = true}) async {
    try {
      if (isLoaderShow) {
        EasyLoading.show(maskType: EasyLoadingMaskType.black);
      }

      ///
      /// Declare the header for the request, if user not loged in then pass emplty array as header
      /// or else pass the authentication token stored on login time
      ///
      Map<String, String> header = {
        "Authorization": "Token token_value",
        'Content-Type': 'application/json',
      };

      Get.printInfo(info: 'Header - ${header.toString()}');
      Get.printInfo(info: 'POST_URL_CALLED - ${baseUrl + url}');
      Get.printInfo(info: 'Parameters - $parameters');

      ///
      /// Make the post method api call with header and given parameter
      ///
      final response = await http.post(Uri.parse(baseUrl + url),
          headers: header, body: parameters);
      Get.printInfo(info: response.body);

      ///
      /// Handle response and errors
      ///
      var map = _returnResponse(response, isShow: isErrorSnackShow);

      ///
      /// Return the map response here and handle it in you model class accordigly
      ///
      return map;
    } on SocketException {
      WidgetConstants.errorSnackBar(content: 'No Internet');
      throw FetchDataException('No Internet connection');
    } finally {
      EasyLoading.dismiss();
    }
  }

  ///
  /// This method is used for call API for the `PUT` method, need to pass API Url endpoint
  ///
  Future<dynamic> put(
    String url,
    var parameters, {
    String objcontentType = jsonContentType,
    bool isLoaderShow = true,
    bool isErrorSnackShow = true,
  }) async {
    try {
      if (isLoaderShow) {
        EasyLoading.show(maskType: EasyLoadingMaskType.black);
      }

      ///
      /// Declare the header for the request, if user not loged in then pass emplty array as header
      /// or else pass the authentication token stored on login time
      ///
      Map<String, String> header = {
        "Authorization": "Token token_value",
        'Content-Type': 'application/json',
      };

      Get.printInfo(info: 'Header - ${header.toString()}');
      Get.printInfo(info: 'PUT_URL_CALLED - ${baseUrl + url}');
      Get.printInfo(info: 'Parameters - $parameters');

      ///
      /// Make the post method api call with header and given parameter
      ///
      final response = await http.put(Uri.parse(baseUrl + url),
          headers: header, body: parameters);
      Get.printInfo(info: response.body);

      ///
      /// Handle response and errors
      ///
      Map<dynamic, dynamic> map =
          _returnResponse(response, isShow: isErrorSnackShow);

      ///
      /// Return the map response here and handle it in you model class accordigly
      ///
      return map;
    } on SocketException {
      WidgetConstants.errorSnackBar(content: 'No Internet');
      throw FetchDataException('No Internet connection');
    } finally {
      EasyLoading.dismiss();
    }
  }

  ///
  /// This method is used for call API for the `PATCH` method, need to pass API Url endpoint
  ///
  Future<dynamic> patch(String url, var parameters,
      {String objcontentType = jsonContentType,
      bool isLoaderShow = true,
      bool isErrorSnackShow = true}) async {
    try {
      if (isLoaderShow) {
        EasyLoading.show(maskType: EasyLoadingMaskType.black);
      }

      ///
      /// Declare the header for the request, if user not loged in then pass emplty array as header
      /// or else pass the authentication token stored on login time
      ///
      Map<String, String> header = {
        "Authorization": "Token token_value",
        'Content-Type': 'application/json',
      };

      Get.printInfo(info: 'Header - ${header.toString()}');
      Get.printInfo(info: 'PATCH_URL_CALLED - ${baseUrl + url}');
      Get.printInfo(info: 'Parameter - $parameters');

      ///
      /// Make the post method api call with header and given parameter
      ///
      final response = await http.patch(Uri.parse(baseUrl + url),
          headers: header, body: parameters);
      Get.printInfo(info: response.body);

      ///
      /// Handle response and errors
      ///
      Map<dynamic, dynamic> map =
          _returnResponse(response, isShow: isErrorSnackShow);

      ///
      /// Return the map response here and handle it in you model class accordigly
      ///
      return map;
    } on SocketException {
      WidgetConstants.errorSnackBar(content: 'No Internet');
      throw FetchDataException('No Internet connection');
    } finally {
      EasyLoading.dismiss();
    }
  }

  dynamic _returnResponse(http.Response response, {bool isShow = true}) {
    EasyLoading.dismiss();
    if (kDebugMode) {
      print(response.statusCode);
    }
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        if (responseJson is! List && responseJson['response'] == "Error") {
          WidgetConstants.errorSnackBar(
            content: responseJson['error_message'],
          );
          throw BadRequestException(responseJson['error_message']);
        }
        return responseJson;

      case 400:
        if (isShow) {
          WidgetConstants.errorSnackBar(
            content: ErrorModel.fromJson(json.decode(response.body.toString()))
                .message!,
          );
        }
        throw BadRequestException(
          ErrorModel.fromJson(
            json.decode(
              response.body.toString(),
            ),
          ).message!,
        );

      case 401:
        if (isShow) {
          WidgetConstants.errorSnackBar(
            content: ErrorModel.fromJson(
              json.decode(
                response.body.toString(),
              ),
            ).message!,
          );
        }
        throw BadRequestException(
          ErrorModel.fromJson(
            json.decode(
              response.body.toString(),
            ),
          ).message!,
        );

      case 403:
        throw UnauthorisedException(
          ErrorModel.fromJson(
            json.decode(
              response.body.toString(),
            ),
          ).message!,
        );

      case 500:
      default:
        throw FetchDataException(
          'Error occured while Communication with Server with StatusCode : ${response.statusCode}',
        );
    }
  }
}
