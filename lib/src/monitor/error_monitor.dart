
import 'package:dio/dio.dart';

/// 上报error，空数据
/// TODO:
/// 1，对服务异常上报到专门到es服务；好处：便于我们自己监控服务挂了之后排查，
/// 2，对特殊场景对异常提供告警服务，好处：严重一些问题，可以直接通过告警服务发送到我到slack或者电话打过来，快速解决服务问题，提升监控对稳定性
reportError({required int? code,required String? msg,required RequestOptions? requestOptions}){
  // loge("code = $code,msg:$msg",tag: "easy_http");
}
