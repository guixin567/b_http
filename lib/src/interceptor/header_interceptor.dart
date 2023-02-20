import 'package:dio/dio.dart';

class HeaderInterceptor extends Interceptor{

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll({"test":"test2"});
    handler.next(options);
  }
}