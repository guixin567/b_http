import 'package:b_http/src/entity/error_entity.dart';
import 'package:b_http/src/monitor/error_monitor.dart';
import 'package:dio/dio.dart';


///错误处理
///
///error上报有2个地方
class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    ///网络异常
    var errorEntity = ErrorEntity.convert(err);
    reportError(code: errorEntity.code,msg:errorEntity.msg,requestOptions:err.requestOptions);
    handler.next(err);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    ///业务异常
    var code = response.data['code'] as int? ?? 0;
    var msg = response.data['msg'];
    if(code != ErrorEntity.success){
      reportError(code: code,msg: msg,requestOptions:response.requestOptions);
    }
    handler.next(response);
  }
}
