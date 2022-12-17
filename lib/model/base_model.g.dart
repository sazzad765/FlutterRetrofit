// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseModelList<T> _$BaseModelListFromJson<T>(Map<String, dynamic> json) =>
    BaseModelList<T>(
      count: json['count'] as int?,
      totalCount: json['totalCount'] as int?,
      page: json['page'] as int?,
      totalPages: json['totalPages'] as int?,
      lastItemIndex: json['lastItemIndex'] as int?,
      results: (json['results'] as List<dynamic>?)
          ?.map(_Converter<T>().fromJson)
          .toList(),
    );

Map<String, dynamic> _$BaseModelListToJson<T>(BaseModelList<T> instance) =>
    <String, dynamic>{
      'count': instance.count,
      'totalCount': instance.totalCount,
      'page': instance.page,
      'totalPages': instance.totalPages,
      'lastItemIndex': instance.lastItemIndex,
      'results': instance.results?.map(_Converter<T>().toJson).toList(),
    };
