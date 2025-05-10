import 'dart:convert';

import '../constants/app_constants.dart';
import 'shared_preferences_helper.dart';

class PreferenceRepository {
  static Future<void> initialize() async {
    await SharedPreferencesHelper.init();
  }

  static Future<void> setTokenData(String? token) async {
    await SharedPreferencesHelper.setString(AppConstants.TOKEN_KEY, token!);
  }

  static Future<String?> getTokenData() async {
    return '${SharedPreferencesHelper.getString(AppConstants.TOKEN_KEY)}';
  }

  static Future<void> setUserID(String? userID) async {
    await SharedPreferencesHelper.setString(AppConstants.USER_ID, userID!);
  }

  static Future<String?> getUserID() async {
    return '${SharedPreferencesHelper.getString(AppConstants.USER_ID)}';
  }

  static Future<void> setGoogleApiKey(String? key) async {
    await SharedPreferencesHelper.setString(AppConstants.GOOGLE_KEY, key!);
  }

  static Future<String?> getGoogleApiKey() async {
    return '${SharedPreferencesHelper.getString(AppConstants.GOOGLE_KEY)}';
  }

  static Future<void> setAccountID(String? accountID) async {
    await SharedPreferencesHelper.setString(
        AppConstants.ACCOUNT_ID, accountID!);
  }

  static Future<String?> getAccountID() async {
    return '${SharedPreferencesHelper.getString(AppConstants.ACCOUNT_ID)}';
  }

  static Future<void> setTriggerTime(int? time) async {
    await SharedPreferencesHelper.setInt(AppConstants.TRIGGET_TIME, time!);
  }

  static Future<int?> getTriggerTime() async {
    return SharedPreferencesHelper.getInt(AppConstants.TRIGGET_TIME) ?? -1;
  }

  static Future<void> setIsLogin(bool? key) async {
    await SharedPreferencesHelper.setBool(AppConstants.IS_LOGIN_KEY, key!);
  }

  static Future<bool?> getIsLogin() async {
    return SharedPreferencesHelper.getBool(AppConstants.IS_LOGIN_KEY) ?? false;
  }

  /// amke it false in login page or checkout screen login..
  static Future<void> setIsGuestLogin(bool? key) async {
    await SharedPreferencesHelper.setBool(
        AppConstants.IS_GUEST_LOGIN_KEY, key!);
  }

  static Future<bool?> getIsGuestLogin() async {
    return SharedPreferencesHelper.getBool(AppConstants.IS_GUEST_LOGIN_KEY) ??
        false;
  }

  // validate shop url            { "shop": "accuspot.myshopify.com", "shop_id": 55451353295 }
  static Future<void> setStoreData(String storeData) async {
    await SharedPreferencesHelper.setString(AppConstants.STORE_DATA, storeData);
  }
  //
  // static Future<StoreDataModel?> getStoreData() async {
  //   final storeJson = SharedPreferencesHelper.getString(AppConstants.STORE_DATA);
  //   if(storeJson != null){
  //     Map<String,dynamic> storeMap = jsonDecode(storeJson);
  //     return StoreDataModel.fromJson(storeMap);
  //   }
  //   return null;
  // }
  //
  //
  // static Future<void> setAppBrandingData(String brandingData) async {
  //   await SharedPreferencesHelper.setString(AppConstants.BRANDING_DATA, brandingData);
  // }
  //
  // static Future<AppBrandingData?> getAppBrandingData() async {
  //   final storeJson = SharedPreferencesHelper.getString(AppConstants.BRANDING_DATA);
  //   if(storeJson != null){
  //     Map<String,dynamic> storeMap = jsonDecode(storeJson);
  //     return AppBrandingData.fromJson(storeMap);
  //   }
  //   return null;
  // }

  /// for storing login user
  // static Future<void> setUserData(String userJson) async {
  //   await SharedPreferencesHelper.setString(AppConstants.SAVED_LOGIN_USER_KEY, userJson);
  // }
  //
  // static Future<UserModel?> getUserData() async {
  //   final userJson = SharedPreferencesHelper.getString(AppConstants.SAVED_LOGIN_USER_KEY);
  //   if (userJson != null) {
  //     Map<String, dynamic> userMap = jsonDecode(userJson);
  //     return UserModel.fromJson(userMap);
  //   }
  //   return null;
  // }
}
