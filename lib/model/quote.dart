import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit_test/model/base_model.dart';
import 'package:retrofit_test/model/response_model.dart';

part 'quote.g.dart';

@JsonSerializable()
class Quote extends DataModel{
  Quote({
    this.id,
    this.author,
    this.content,
    this.tags,
    this.authorSlug,
    this.length,
    this.dateAdded,
    this.dateModified,
  });

  @JsonKey(name: '_id')
  String? id;

  @JsonKey(name: 'author')
  String? author;

  @JsonKey(name: 'content')
  String? content;

  @JsonKey(name: 'tags')
  List<String>? tags;

  @JsonKey(name: 'authorSlug')
  String? authorSlug;

  @JsonKey(name: 'length')
  int? length;

  @JsonKey(name: 'dateAdded')
  DateTime? dateAdded;

  @JsonKey(name: 'dateModified')
  DateTime? dateModified;

  factory Quote.fromJson(Map<String, dynamic> json) =>_$QuoteFromJson(json);

  @override
  fromJson(Map<String, dynamic> data) {
    return _$QuoteFromJson(data);
  }

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }

// Map<String, dynamic> toJson() => _$QuoteToJson(this);
}
