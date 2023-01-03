import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:sports_kingdom_assignment/global/models/base_exception.dart';
import 'package:sports_kingdom_assignment/global/models/response_model.dart';
import 'package:sports_kingdom_assignment/global/services/api_service.dart';

class MockApiService extends ApiService {
  @override
  Future<ResponseModel> getCurrentPrice() async {
    try {
      var data = {
        "time": {
          "updated": "Jan 3, 2023 13:50:00 UTC",
          "updatedISO": "2023-01-03T13:50:00+00:00",
          "updateduk": "Jan 3, 2023 at 13:50 GMT"
        },
        "disclaimer":
            "This data was produced from the CoinDesk Bitcoin Price Index (USD). Non-USD currency data converted using hourly conversion rate from openexchangerates.org",
        "chartName": "Bitcoin",
        "bpi": {
          "USD": {
            "code": "USD",
            "symbol": "&#36;",
            "rate": "16,690.6369",
            "description": "United States Dollar",
            "rate_float": 16690.6369
          },
          "GBP": {
            "code": "GBP",
            "symbol": "&pound;",
            "rate": "13,946.5627",
            "description": "British Pound Sterling",
            "rate_float": 13946.5627
          },
          "EUR": {
            "code": "EUR",
            "symbol": "&euro;",
            "rate": "16,259.1172",
            "description": "Euro",
            "rate_float": 16259.1172
          }
        }
      };
      return ResponseModel.fromJson(data);
    } on DioError catch (e) {
      throw BaseException(message: e.message);
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }
}
