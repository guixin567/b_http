import 'package:b_http/src/entity/response_entity.dart';
import 'package:b_http/src/interceptor/connection_interceptor.dart';
import 'package:b_http/src/interceptor/interceptors.dart';
import 'package:b_http/src/interceptor/loading_interceptor.dart';
import 'package:dio/dio.dart';

typedef Converter<T> = T Function(dynamic data);

class HttpUtil {
  static HttpUtil? _instance;

  factory HttpUtil() => _instance ??= HttpUtil._();

  final int _connectTimeout = 30000;
  final int _receiveTimeout = 30000;
  final String _baseUrl = "http://localhost:8092";
  late Dio _dio;

  HttpUtil._() {
    ///初始化 配置信息
    _dio = Dio(BaseOptions(
      connectTimeout: Duration(milliseconds: _connectTimeout),
      receiveTimeout: Duration(milliseconds: _receiveTimeout),
      baseUrl: _baseUrl,
    ));
    _dio.interceptors.addAll([
      ConnectionInterceptor(),
      LoadingInterceptor(),
      LogInterceptor(),
      ErrorInterceptor(),
    ]);
  }

  Future<ResponseEntity<T>> get<T>({
    required String path,
    Map<String, dynamic>? params,
    Converter<T>? converter,
    bool isLoading = false,
    bool isShowError = false,
  }) async {
    return _request(
      path,
      params,
      Options(method: "get"),
      converter,
      isLoading,
      isShowError,
    );
  }

  post<T>({
    required String path,
    Map<String, dynamic>? params,
    Converter<T>? converter,
    bool isLoading = false,
    bool isShowError = false,
  }) async {
    return _request(
      path,
      params,
      Options(method: "post"),
      converter,
      isLoading,
      isShowError,
    );
  }

  Future<ResponseEntity<T>> _request<T>(
      String path,
      Map<String, dynamic>? params,
      Options options,
      Converter<T>? converter,
      bool isLoading,
      bool isShowError) async {
    ResponseEntity<T>? result;

    options.extra = {
      "isLoading": isLoading == true,
      "isShowError": isShowError == true,
    };
    try {
      var response =
          await _dio.request(path, queryParameters: params, options: options);
      result = _parse(response, converter);
    } catch (e) {
      // logv(e);
    }
    return result ?? ResponseEntity();
  }

  ResponseEntity<T> _parse<T>(Response? response, Converter<T>? converter) {
    return ResponseEntity.fromJson(
        response?.data, converter?.call(response?.data["data"]));
  }
}
