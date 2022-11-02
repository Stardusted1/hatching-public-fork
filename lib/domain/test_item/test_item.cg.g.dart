// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_item.cg.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TestMultipleItems _$TestMultipleItemsFromJson(Map<String, dynamic> json) =>
    TestMultipleItems(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      previewUrl: json['previewUrl'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => TestSingleItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TestMultipleItemsToJson(TestMultipleItems instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'previewUrl': instance.previewUrl,
      'items': instance.items,
    };

TestSingleItem _$TestSingleItemFromJson(Map<String, dynamic> json) =>
    TestSingleItem(
      testGroup: json['testGroup'] as String,
      testJson: json['testJson'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      previewUrl: json['previewUrl'] as String,
    );

Map<String, dynamic> _$TestSingleItemToJson(TestSingleItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'previewUrl': instance.previewUrl,
      'testJson': instance.testJson,
      'testGroup': instance.testGroup,
    };
