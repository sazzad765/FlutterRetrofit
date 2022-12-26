import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'quote.g.dart';

@JsonSerializable()
class Quote{
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


  String? author;


  String? content;


  List<String>? tags;


  String? authorSlug;


  int? length;


  DateTime? dateAdded;


  DateTime? dateModified;

  factory Quote.fromJson(Map<String, dynamic> json) =>_$QuoteFromJson(json);

Map<String, dynamic> toJson() => _$QuoteToJson(this);
}
