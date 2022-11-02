import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:svg_path_parser/svg_path_parser.dart' as parser;
import 'package:xml/xml.dart';

part 'test_item.cg.g.dart';

class BaseTestItem {
  @JsonKey()
  final String id;
  @JsonKey()
  final String name;
  @JsonKey()
  final String description;
  @JsonKey()
  final String previewUrl;

  BaseTestItem({
    required this.id,
    required this.name,
    required this.description,
    required this.previewUrl,
  });
}

@JsonSerializable()
class TestMultipleItems extends BaseTestItem {
  @JsonKey()
  final List<TestSingleItem> items;

  TestMultipleItems({
    required super.id,
    required super.name,
    required super.description,
    required super.previewUrl,
    required this.items,
  });

  static TestMultipleItems fromJson(Map<String, dynamic> json) =>
      _$TestMultipleItemsFromJson(json);

  Map<String, dynamic> toJson() => _$TestMultipleItemsToJson(this);
}

@JsonSerializable()
class TestSingleItem extends BaseTestItem {
  @JsonKey()
  final String testJson;
  @JsonKey()
  final String testGroup;

  TestSingleItem({
    required this.testGroup,
    required this.testJson,
    required super.id,
    required super.name,
    required super.description,
    required super.previewUrl,
  });

  static TestSingleItem fromJson(Map<String, dynamic> json) =>
      _$TestSingleItemFromJson(json);

  Path get targetPath {
    final document = XmlDocument.parse(testJson);
    final parts = document.findAllElements("g");

    final element = parts.firstWhere(
      (e) => e.attributes
          .where((attr) => attr.name.local == "id" && attr.value == "target")
          .isNotEmpty,
    );
    final path = element
        .findElements("path")
        .first
        .attributes
        .firstWhere((attr) => attr.name.local == "d")
        .value;

    return parser.parseSvgPath(path);
  }

  Map<String, dynamic> toJson() => _$TestSingleItemToJson(this);
}
