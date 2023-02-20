import 'package:dio/dio.dart';

class ErrorEntity {
  static const int success = 200;
  static const int unauthorized = 401;
  static const int forbidden = 403;
  static const int notFound = 404;
  static const int requestTimeout = 408;
  static const int internalServerError = 500;
  static const int badGateway = 502;
  static const int serviceUnavailable = 503;
  static const int gatewayTimeout = 504;

  static const int parseError = 100001;
  static const int networkError = 100002;
  static const int httpError = 100003;
  static const int sslError = 100004;
  static const int connectTimeout = 100005;
  static const int receiveTimeout = 100006;
  static const int sendTimeout = 100007;
  static const int cancel = 100008;
  static const int other = 100009;

  int? code;
  String? msg;

  ErrorEntity({this.code, this.msg});

  factory ErrorEntity.convert(DioError error) {
    String? msg = error.message;
    int code = 0;
    switch (error.type) {
      case DioErrorType.connectionTimeout:
        code = connectTimeout;
        msg = "网络连接超时，请检查网络设置";
        break;
      case DioErrorType.receiveTimeout:
        code = receiveTimeout;
        msg = "服务器异常，请稍后重试！";
        break;
      case DioErrorType.sendTimeout:
        code = sendTimeout;
        msg = "网络连接超时，请检查网络设置";
        break;
      case DioErrorType.badCertificate:
        code = httpError;
        msg = "服务器异常，请稍后重试！";
        break;
      case DioErrorType.cancel:
        code = cancel;
        msg = "请求已被取消，请重新请求";
        break;
      case DioErrorType.unknown:
        code = other;
        msg = "网络异常，请稍后重试！";
        break;
    }
    return ErrorEntity(code: code, msg: msg);
  }
}
