import 'package:amazon_clone/constants/error_handling.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthService {
  //sign Up user
  void signUp({
    required String name,
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      User user = User(
          id: '',
          name: name,
          email: email,
          password: password,
          address: '',
          type: '',
          token: '');

      http.Response response = await http.post(
        Uri.parse('$uri/api/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-type': 'applications/json; charset=UTF-8'
        },
      );
      //can give error

      httpError(
          response: response,
          context: context,
          onSuccess: () {
            showSnackBar(context, "Account Has Been Created");
          });
    } catch (e)
    // ignore: empty_catches
    {}
  }
}
