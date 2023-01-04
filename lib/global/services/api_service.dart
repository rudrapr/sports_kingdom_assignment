import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:sports_kingdom_assignment/global/models/base_exception.dart';
import 'package:sports_kingdom_assignment/global/models/response_model.dart';
import 'package:sports_kingdom_assignment/global/services/retry_interceptor.dart';

class ApiService {
  final Dio _dio = Dio();

  ApiService() {
    _dio.options = BaseOptions(baseUrl: "https://api.coindesk.com/v1/bpi");
    _dio.interceptors.add(RetryInterceptor(client: _dio));
  }

  Future<ResponseModel> getCurrentPrice() async {
    try {
      var res = await _dio.get("/currentprice.json");
      return ResponseModel.fromJson(jsonDecode(res.data));
    } on DioError catch (e) {
      throw BaseException(message: e.message);
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }
}
