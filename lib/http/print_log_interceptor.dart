import 'package:dio/dio.dart';

class PrintLogInterceptor extends InterceptorsWrapper {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('Status: ${response.statusCode}, ${response.realUri}');
    super.onResponse(response, handler);
  }
}