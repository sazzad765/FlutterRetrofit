import 'dart:core';
import 'package:json_annotation/json_annotation.dart';

// extension BaseModel on Type {
//   fromJson(Map<String, dynamic> data) {}
// }

@JsonSerializable(genericArgumentFactories: true)
class BaseResponse<T> {
  BaseResponse({
    this.count,
    this.totalCount,
    this.page,
    this.totalPages,
    this.lastItemIndex,
    this.results,
  });

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

  factory BaseResponse.fromJson(Map<String, dynamic> json,  Function(dynamic) create) {
    return BaseResponse(
      count: json['count'] as int?,
      totalCount: json['totalCount'] as int?,
      page: json['page'] as int?,
      totalPages: json['totalPages'] as int?,
      lastItemIndex: json['lastItemIndex'] as int?,
      results:create(json['results']),
    );
  }

// Map<String, T> toJson() => _$BaseModelListToJson<T>(this);

}


