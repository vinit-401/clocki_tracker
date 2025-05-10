import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../constants/api_constants.dart';
import '../../constants/logs.dart';

class DioClient {
  Dio? _dio;
  String? token;
  BuildContext? context;

  DioClient(this._dio, this.context) {
    _dio = Dio();
    token = '';

    /// FOR PRODUCTION TEST
    updateHeader(getToken: token, dio: _dio);
    // _dio?.options.headers = {'Content-Type': 'application/json', 'Accept': 'application/json'};
  }

  updateHeader({String? getToken, Dio? dio}) async {
    dio
      ?..options.baseUrl = ApiConstant.BASE_URL
      ..options.connectTimeout = const Duration(seconds: 15)
      ..options.receiveTimeout = const Duration(seconds: 15)
      ..httpClientAdapter
      ..options.contentType = Headers.jsonContentType
      ..options.validateStatus = ((status) => true)
      ..options.responseType = ResponseType.json
      ..options.headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      };

    _dio!.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions requestOptions,
            RequestInterceptorHandler handler) async {
          // String? _accessToken = await PreferenceRepository.getTokenData();
          // requestOptions.headers.addAll({'auth-token': _accessToken});
          PRINT_LOGS("HEADER>>>", requestOptions.headers.toString());
          REQUEST_PRINT(
            body: requestOptions.data,
            url:
                requestOptions.path + requestOptions.queryParameters.toString(),
          );

          return handler.next(requestOptions); // Continue with the request
        },
        onResponse:
            (Response response, ResponseInterceptorHandler handler) async {
          //print('code>>>>${response.statusCode}');
          /*  if (response.statusCode == 401) {
            await handleLogout(context);
            return;
          }*/
          PRINT_LOGS("RESPONSE>>>>>", response.data.toString());
          return handler.next(response); // Continue with the response
        },
        onError: (DioException error, ErrorInterceptorHandler handler) async {
          print('Ecode>>>>${error.response?.statusCode}');
          return handler.next(error);
        },
      ),
    );

    /*    _dio!.interceptors.add(InterceptorsWrapper(
      onRequest: (requestOptions, handler) async {
        _ongoingRequests++;
        _accessToken = await PreferenceRepository.getTokenData();
        requestOptions.headers.addAll({
          //  'app-subdomain': await PreferenceRepository.getCompanyName() ?? '',
          'app-maca': await getDeviceId() ?? '',
          'Authorization': _accessToken,
        });
        handler.next(requestOptions);
        //}
        PRINT_LOGS("HEADER>>>", requestOptions.headers.toString());

        try {
          REQUEST_PRINT(
              body: requestOptions.data, url: requestOptions.path + requestOptions.queryParameters.toString());
        } catch (e) {}
      },
      onResponse: (response, handler) async {
        //PRINT_LOGS("CODE>>>", response.data.toString());
        _ongoingRequests--;
        if (response.data['status'] == 401) {
          _handleTokenExpiration(response, handler);

          /// ALL REQUEST IS FINISHED
          if (_ongoingRequests == 0 && !_isRefreshing) {
            await Future.delayed(const Duration(seconds: 4));

            if (checkIsUnAuthorised()) {
              handler.next(response);
            }
          }
        } else {
          handler.next(response);
        }
      },
      onError: (error, handler) {
        _ongoingRequests--;
        PRINT_LOGS("ERROR>>>", error.toString());
        handler.next(error); // Continue handling the error
      },
    ));*/
  }

  /*  bool checkIsUnAuthorised() {
    bool allResponsesUnauthorized = true;

    for (var request in _requestsNeedRetry) {
      print('CHECK_CODE>>>${request.response.data['code']}');
      if (request.response.data['code'] != 'unauthorized') {
        allResponsesUnauthorized = false;
        break; // Exit the loop early if a non-'unauthorized' response is found
      }
    }
    return allResponsesUnauthorized;
  }*/

  // Call Post Api
  Future<Response> post(String uri, {data, header}) async {
    try {
      var response = await _dio!.post(uri, data: data);
      return response;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  // Call Get Api
  Future<Response> get(String uri, {header, parameter}) async {
    try {
      Response response = await _dio!.get(uri,
          options: Options(headers: header), queryParameters: parameter);
      return response;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  // Call Put Api
  Future<Response> put(String uri, {header, parameter, body}) async {
    try {
      Response response = await _dio!.put(
        uri,
        options: Options(headers: header),
        data: body,
        queryParameters: parameter,
      );
      return response;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  // Call Patch Api
  Future<Response> patch(String uri, {header, parameter, body}) async {
    try {
      Response response = await _dio!.patch(
        uri,
        options: Options(headers: header),
        data: body,
        queryParameters: parameter,
      );
      return response;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  // Call Delete Api
  Future<Response> delete(String uri, {header, parameter, body}) async {
    try {
      Response response = await _dio!.delete(
        uri,
        options: Options(headers: header),
        data: body,
        queryParameters: parameter,
      );
      return response;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }
}
