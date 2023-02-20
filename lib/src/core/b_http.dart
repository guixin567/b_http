
import 'package:b_http/src/core/http_util.dart';
import 'package:b_http/src/entity/response_entity.dart';

Future<ResponseEntity<T>> get<T>({
  required String path,
  Map<String, dynamic>? params,
  Converter<T>? converter,
  bool isLoading = false,
}) async {
  return HttpUtil().get(
      path: path, params: params, converter: converter, isLoading: isLoading);
}

post<T>({
  required String path,
  Map<String, dynamic>? params,
  Converter<T>? converter,
  bool isLoading = false,
}) async {
  return HttpUtil().post(
      path: path, params: params, converter: converter, isLoading: isLoading);
}
