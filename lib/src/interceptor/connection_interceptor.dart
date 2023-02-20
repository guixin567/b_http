import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';

class ConnectionInterceptor extends Interceptor{
 @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async{
  bool isShowError = options.extra["isShowError"] == true;
  var connectivityResult = await Connectivity().checkConnectivity();
   if(connectivityResult == ConnectivityResult.none && isShowError){
     // showToast(text: "网络断开了，请检测网络");
   }
    handler.next(options);
  }
}