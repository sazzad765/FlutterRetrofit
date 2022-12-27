import 'dart:core';
import 'package:json_annotation/json_annotation.dart';

// extension BaseModel on Type {
//   fromJson(Map<String, dynamic> data) {}
// }

enum APIResultType { success, connectionProblem, timeout, unauthorized, error }

@JsonSerializable(genericArgumentFactories: true)
class BaseResponse<T> {
  BaseResponse(
      {this.count,
      this.totalCount,
      this.page,
      this.totalPages,
      this.lastItemIndex,
      this.results,
      this.type = APIResultType.success, this.errorMessage = ''});

  @JsonKey(name: 'count')
  int? count;

  @JsonKey(name: 'totalCount')
  int? totalCount;

  @JsonKey(name: 'page')
  int? page;

  @JsonKey(name: 'totalPages')
  int? totalPages;

  @JsonKey(name: 'lastItemIndex')
  int? lastItemIndex;

  @JsonKey(name: 'results')
  T? results;

  APIResultType type;
  String errorMessage;

  factory BaseResponse.fromJson(
      Map<String, dynamic> json, Function(dynamic) create) {
    return BaseResponse(
      count: json['count'] as int?,
      totalCount: json['totalCount'] as int?,
      page: json['page'] as int?,
      totalPages: json['totalPages'] as int?,
      lastItemIndex: json['lastItemIndex'] as int?,
      type: APIResultType.success,
      results: json['results'] == null ? null : create(json['results']),
    );
  }

// Map<String, T> toJson() => _$BaseModelListToJson<T>(this);

}
