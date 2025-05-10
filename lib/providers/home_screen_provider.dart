import 'package:clocki_tracker/app_remote_network/dio/dio_client.dart';
import 'package:clocki_tracker/constants/logs.dart';
import 'package:clocki_tracker/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class UserProfileProvider with ChangeNotifier {
  final DioClient dioClient;
  UserProfileProvider(this.dioClient);
  bool isLoading = false;
  setIsLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  UserModel? userModel;

  Future<void> getUserProfile(String? username, String? password) async {
    try {
      setIsLoading(true);
      Map<String, String> param = {
        "username": 'emilys',
        "password": 'emilyspass',
        "expiresInMins": "30", // optional, defaults to 60
      };
      Response response =
          await dioClient.post('https://dummyjson.com/user/login', data: param);
      if (response.statusCode == 200) {
        userModel = UserModel.fromJson(response.data);
        PRINT_LOGS('User Model', '$userModel');
        notifyListeners();
      } else {
        // showCustomToastError(context, text)
        print(response.statusCode);
      }
    } catch (err) {
      PRINT_LOGS('error at getUserProfile', '$err');
    }
  }
}
