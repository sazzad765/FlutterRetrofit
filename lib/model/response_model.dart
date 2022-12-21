import 'dart:convert';
import 'dart:core';

import 'package:flutter/foundation.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

// extension BaseModel on Type {
//   fromJson(Map<String, dynamic> data) {}
// }



abstract class DataModel extends Equatable {
  const DataModel();

  Map<String, dynamic> toJson();

  @override
  String toString() => jsonEncode(toJson());
}

typedef DataFactory<T extends DataModel> = T Function(
    Map<String, dynamic> json,
    );

T makeModel<T extends DataModel>(Map<dynamic, dynamic> json) {
  if (!dataModelFactories.containsKey(T)) {
    throw TypeError();
  }
  try {
    return dataModelFactories[T]!(json) as T;
  } catch (e) {
    print(
      'Error when making model with $T type: $e\n'
          '${json.containsKey('id') ? 'Model contains id: ${json['id']}\n' : ''}'
          'The raw data which make this error is:\n'
          // '${GlobalJsonEncoder.convert(json)}',
    );
    rethrow;
  }
}

class EmptyDataModel extends DataModel {
  const EmptyDataModel();

  factory EmptyDataModel.fromJson(dynamic _) => const EmptyDataModel();

  @override
  Map<String, dynamic> toJson() => const <String, dynamic>{};

  @override
  List<Object?> get props => <Object?>[null];
}

@JsonSerializable(explicitToJson: true)
class ResponseModel<T extends DataModel> {
   ResponseModel({
    this.count,
    this.totalCount,
    this.page,
    this.totalPages,
    this.lastItemIndex,
    this.results,
  });

  factory ResponseModel.fromJson(
      Map<String, dynamic> json) {
    return ResponseModel<T>(
      count: json['count'] as int?,
      totalCount: json['totalCount'] as int?,
      page: json['page'] as int?,
      totalPages: json['totalPages'] as int?,
      lastItemIndex: json['lastItemIndex'] as int?,
      results:
      (json['results'] as List<dynamic>)
          .cast<Map<dynamic, dynamic>>()
          .map((Map<dynamic, dynamic> item) => makeModel<T>(item))
          .toList(),
    );
  }

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


  //
  // Map<String, dynamic> toJson() {
  //   return <String, dynamic>{
  //     'code': code,
  //     'msg': msg,
  //     if (data != null) 'data': data!.toJson(),
  //     if (pageNum != null) 'page_num': pageNum,
  //     if (pageSize != null) 'page_size': pageSize,
  //     if (total != null) 'count': total,
  //     if (models != null)
  //       'models': models!.map((T model) => model.toJson()).toList(),
  //   };
  // }

  // @override
  // String toString() => const JsonEncoder.withIndent('  ').convert(toJson());
}

final Map<Type, Function> dataModelFactories = <Type, DataFactory>{
  EmptyDataModel: (Map<String, dynamic> json) => EmptyDataModel.fromJson(json),
};