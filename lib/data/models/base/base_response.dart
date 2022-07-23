import 'base_error.dart';

class BaseResponse<T> {
  T? result;
  int? statusCode;
  String? message;
  String? version;
  ResponseException? responseException;
  late Paging paging;
  late List<Links> links;

  BaseResponse();

  BaseResponse.fromJson(Map<String, dynamic> map) {
    BaseResponse baseResponse = BaseResponse<T>();
    version = map['version'];
    statusCode = map['statusCode'];
    message = map['message'];
    if (map.containsKey('responseException'))
      responseException = ResponseException.fromJson(map['responseException']);
  }

  fromJson(Map<String, dynamic> map) {
    BaseResponse baseResponse = BaseResponse<T>();
    version = map['version'];
    statusCode = map['statusCode'];
    message = map['message'];
    if (map.containsKey('responseException'))
      responseException = ResponseException.fromJson(map['responseException']);

    if (map.containsKey('result')) {
      var json = map['result'];

      if (json.runtimeType != List) {
        if (json.containsKey('paging')) {
          paging = Paging.fromJson(json['paging']);
        }

        if (json.containsKey('links')) {
          links = <Links>[];
          json['links'].forEach((v) {
            links.add(new Links.fromJson(v));
          });
        }
      }
    }
  }

  _findValueByKey(Map<String, dynamic> map, dynamic key) {
    map.keys.firstWhere((k) => k.toString().contains(key), orElse: () => key);
  }
}

class Paging {
  late int totalItems;
  late int pageNumber;
  late int pageSize;
  late int totalPages;

  Paging();

  Paging.fromJson(Map<String, dynamic> json) {
    totalItems = json['totalItems'];
    pageNumber = json['pageNumber'];
    pageSize = json['pageSize'];
    totalPages = json['totalPages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalItems'] = this.totalItems;
    data['pageNumber'] = this.pageNumber;
    data['pageSize'] = this.pageSize;
    data['totalPages'] = this.totalPages;
    return data;
  }
}

class Links {
  late String href;
  late String rel;
  late String method;

  Links();

  Links.fromJson(Map<String, dynamic> json) {
    href = json['href'];
    rel = json['rel'];
    method = json['method'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this.href;
    data['rel'] = this.rel;
    data['method'] = this.method;
    return data;
  }
}
