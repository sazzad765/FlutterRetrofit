import 'dart:core';
import 'package:json_annotation/json_annotation.dart';

// extension BaseModel on Type {
//   fromJson(Map<String, dynamic> data) {}
// }

@JsonSerializable(genericArgumentFactories: true)
class BaseModelList<T> {
  BaseModelList({
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
  List<T>? results;

  factory BaseModelList.fromJson(Map<String, dynamic> json,  Function(Map<String, dynamic>) create) {
    return BaseModelList(
      count: json['count'] as int?,
      totalCount: json['totalCount'] as int?,
      page: json['page'] as int?,
      totalPages: json['totalPages'] as int?,
      lastItemIndex: json['lastItemIndex'] as int?,
      results: List<T>.from(json['results'].map((item) => create(item))),

      // (json['results'] as List<dynamic>?)
      //     ?.map(T.fromJson)
      //     .toList(),
    );
  }

// Map<String, T> toJson() => _$BaseModelListToJson<T>(this);

}

// class _Converter<T> implements JsonConverter<T, Object?> {
//   const _Converter();
//
//   @override
//   T fromJson(Object? json) {
//     switch (T) {
//       case Quote:
//         return Quote.fromJson(json as Map<String, dynamic>) as T;
//       // case DataModel2:
//       //   return DataModel2.fromJson(json as Map<String, dynamic>) as T;
//       // case DataModel3:
//       //   return DataModel3.fromJson(json as Map<String, dynamic>) as T;
//       default:
//         throw UnsupportedError('Unsupported type: $T');
//     }
//   }
//
//   @override
//   Object? toJson(T object) => object;
// }

abstract class BaseModel{
  fromJson(Map<String, dynamic> data);
}
