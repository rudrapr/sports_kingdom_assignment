import 'package:dio/dio.dart';

class RetryInterceptor extends InterceptorsWrapper {
  Dio client;

  RetryInterceptor({required this.client});

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    return handler.resolve(await _retry(err.requestOptions));
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return client.request<dynamic>(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  }
}
