
import 'package:b_http/src/entity/error_entity.dart';

class ResponseEntity<T> {
  int? code;
  String? msg;
  T? data;

  ResponseEntity({
    this.code,
    this.msg,
    this.data,
  });

  ///接口是否正常
  bool isSuccess() => code == ErrorEntity.success;

  ResponseEntity.fromJson(
    Map<String, dynamic> json,
    T? result,
  ) {
    code = json['code'] as int? ?? 0;
    msg = json['msg']?.toString();
    data = result ?? json['data'];
  }
}
