import 'package:b_http/src/toast/toast.dart';
import 'package:dio/dio.dart';

///加载框
class LoadingInterceptor extends Interceptor{
  CancelFunc? loadCancel;
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    bool isLoading = options.extra["isLoading"] == true;
    if(isLoading){
      loadCancel = showLoading();
    }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    loadCancel?.call();
    handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    loadCancel?.call();
    handler.next(err);
  }
}