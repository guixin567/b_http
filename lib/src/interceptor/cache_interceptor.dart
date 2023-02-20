import 'package:dio/dio.dart';

///TODO:缓存后期可以做
///好处：本身数据变化不是很大就可以先从缓存获取，再从接口获取，提升体验
class CacheInterceptor extends Interceptor {}
