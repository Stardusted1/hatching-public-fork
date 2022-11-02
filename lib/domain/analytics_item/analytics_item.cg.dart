import 'package:easy_localization/easy_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'analytics_item.cg.freezed.dart';

part 'analytics_item.cg.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class AnalyticsItem with _$AnalyticsItem {
  const AnalyticsItem._();

  const factory AnalyticsItem({
    required String id,
    required String name,
    required String description,
    String? userId,
    @JsonKey(
      fromJson: AnalyticsItem._fromJsonData,
      toJson: AnalyticsItem._toJsonData,
    )
        required List<AnalyticsItemDetails> data,
  }) = _AnalyticsItem;

  List<Data<int, int>> get getSuccessfulSamples {
    final result = <Data<int, int>>[];
    final sampleData = data.where((e) => e.totalErrors < e.totalPoints);
    for (int i = 0; i < sampleData.length; i++) {
      final item = sampleData.elementAt(i);
      result.add(Data(x: i, y: item.accuracy.toInt()));
    }
    return result;
  }

  List<Data<int, int>> get getUnsuccessfulSamples {
    final result = <Data<int, int>>[];
    final sampleData = data.where((e) => e.totalErrors > e.totalPoints);
    for (int i = 0; i < sampleData.length; i++) {
      final item = sampleData.elementAt(i);
      result.add(Data(x: i, y: item.accuracy.toInt()));
    }
    return result;
  }

  int get getMeanDuration {
    if (data.isEmpty) return 0;
    return data.fold<int>(
          0,
          (previous, element) => previous + element.duration.inSeconds,
        ) ~/
        data.length;
  }

  List<Data<String, int>> get getScopedDetails {
    final result = <Data<String, int>>[];
    final successfulSamples = getSuccessfulSamples.length;
    final unsuccessfulSamples = getUnsuccessfulSamples.length;
    result.addAll([
      Data(
        x: "✅",
        y: successfulSamples,
      ),
      Data(
        x: "❌",
        y: unsuccessfulSamples,
      ),
      if (data.length - successfulSamples - unsuccessfulSamples > 0)
        Data(
          x: "❓",
          y: data.length - successfulSamples - unsuccessfulSamples,
        ),
    ]);
    return result;
  }

  factory AnalyticsItem.fromJson(Map<String, dynamic> json) =>
      _$AnalyticsItemFromJson(json);

  static List<AnalyticsItemDetails> _fromJsonData(List<dynamic> json) {
    return json.map((e) => AnalyticsItemDetails.fromJson(e)).toList();
  }

  static List<dynamic> _toJsonData(List<AnalyticsItemDetails> json) {
    return json.map((e) => e.toJson()).toList();
  }
}

@Freezed(makeCollectionsUnmodifiable: false)
class AnalyticsItemDetails with _$AnalyticsItemDetails {
  const factory AnalyticsItemDetails({
    required double accuracy,
    required double meanAccuracy,
    required Duration duration,
    required DateTime startTime,
    required DateTime endTime,
    required int totalPoints,
    required int totalErrors,
    required int totalRetries,
  }) = _AnalyticsItemDetails;

  factory AnalyticsItemDetails.fromJson(Map<String, dynamic> json) =>
      _$AnalyticsItemDetailsFromJson(json);
}

class Data<T, D> {
  final T x;
  final D y;

  const Data({required this.x, required this.y});
}

extension DateTimeHelper on DateTime {
  String format(String format, {String stringLocale = 'en'}) {
    return DateFormat(format, stringLocale).format(this);
  }
}
