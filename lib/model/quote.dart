import 'package:json_annotation/json_annotation.dart';

part 'quote.g.dart';

@JsonSerializable()
class Quote {
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

  factory Quote.fromJson(Map<String, dynamic> json) => _$QuoteFromJson(json);

  Map<String, dynamic> toJson() => _$QuoteToJson(this);
}
