// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analytics_item.cg.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AnalyticsItem _$$_AnalyticsItemFromJson(Map<String, dynamic> json) =>
    _$_AnalyticsItem(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      userId: json['userId'] as String?,
      data: AnalyticsItem._fromJsonData(json['data'] as List),
    );

Map<String, dynamic> _$$_AnalyticsItemToJson(_$_AnalyticsItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'userId': instance.userId,
      'data': AnalyticsItem._toJsonData(instance.data),
    };

_$_AnalyticsItemDetails _$$_AnalyticsItemDetailsFromJson(
        Map<String, dynamic> json) =>
    _$_AnalyticsItemDetails(
      accuracy: (json['accuracy'] as num).toDouble(),
      meanAccuracy: (json['meanAccuracy'] as num).toDouble(),
      duration: Duration(microseconds: json['duration'] as int),
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: DateTime.parse(json['endTime'] as String),
      totalPoints: json['totalPoints'] as int,
      totalErrors: json['totalErrors'] as int,
      totalRetries: json['totalRetries'] as int,
    );

Map<String, dynamic> _$$_AnalyticsItemDetailsToJson(
        _$_AnalyticsItemDetails instance) =>
    <String, dynamic>{
      'accuracy': instance.accuracy,
      'meanAccuracy': instance.meanAccuracy,
      'duration': instance.duration.inMicroseconds,
      'startTime': instance.startTime.toIso8601String(),
      'endTime': instance.endTime.toIso8601String(),
      'totalPoints': instance.totalPoints,
      'totalErrors': instance.totalErrors,
      'totalRetries': instance.totalRetries,
    };
