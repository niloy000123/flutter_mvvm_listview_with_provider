import 'dart:convert';
import 'dart:io';
import 'package:flutter_mvvm_listview_with_provider/repo/api_status.dart';
import 'package:flutter_mvvm_listview_with_provider/utils/constants.dart';
import 'package:http/http.dart' as http;

import '../model/users_list_model.dart';

class UserServices {
  static Future<Object> getUser() async {
    try {
      var url = Uri.parse(USER_LIST);
      var response = await http.get(url);
      var body = json.decode(response.body);
      if (response.statusCode == 200) {
        return Success(
            responce: (body as List)
                .map((data) => UserModel.fromJson(data))
                .toList());
      }
      return Failure(
          code: USER_INVALID_RESPONSE, errorResponce: 'USER_INVALID_RESPONSE');
    } on HttpException {
      return Failure(code: NO_INTERNATE, errorResponce: 'NO_INTERNATE');
    } on FormatException {
      return Failure(code: INVALID_FORMAT, errorResponce: 'INVALID_FORMAT');
    } catch (e) {
      return Failure(code: UNKNOWN_ERROR, errorResponce: 'UNKNOWN_ERROR');
    }
  }
}
