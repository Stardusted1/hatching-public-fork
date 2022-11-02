// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'analytics_item.cg.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AnalyticsItem _$AnalyticsItemFromJson(Map<String, dynamic> json) {
  return _AnalyticsItem.fromJson(json);
}

/// @nodoc
mixin _$AnalyticsItem {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(
      fromJson: AnalyticsItem._fromJsonData, toJson: AnalyticsItem._toJsonData)
  List<AnalyticsItemDetails> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnalyticsItemCopyWith<AnalyticsItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalyticsItemCopyWith<$Res> {
  factory $AnalyticsItemCopyWith(
          AnalyticsItem value, $Res Function(AnalyticsItem) then) =
      _$AnalyticsItemCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String name,
      String description,
      String? userId,
      @JsonKey(fromJson: AnalyticsItem._fromJsonData, toJson: AnalyticsItem._toJsonData)
          List<AnalyticsItemDetails> data});
}

/// @nodoc
class _$AnalyticsItemCopyWithImpl<$Res>
    implements $AnalyticsItemCopyWith<$Res> {
  _$AnalyticsItemCopyWithImpl(this._value, this._then);

  final AnalyticsItem _value;
  // ignore: unused_field
  final $Res Function(AnalyticsItem) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? userId = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<AnalyticsItemDetails>,
    ));
  }
}

/// @nodoc
abstract class _$$_AnalyticsItemCopyWith<$Res>
    implements $AnalyticsItemCopyWith<$Res> {
  factory _$$_AnalyticsItemCopyWith(
          _$_AnalyticsItem value, $Res Function(_$_AnalyticsItem) then) =
      __$$_AnalyticsItemCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String name,
      String description,
      String? userId,
      @JsonKey(fromJson: AnalyticsItem._fromJsonData, toJson: AnalyticsItem._toJsonData)
          List<AnalyticsItemDetails> data});
}

/// @nodoc
class __$$_AnalyticsItemCopyWithImpl<$Res>
    extends _$AnalyticsItemCopyWithImpl<$Res>
    implements _$$_AnalyticsItemCopyWith<$Res> {
  __$$_AnalyticsItemCopyWithImpl(
      _$_AnalyticsItem _value, $Res Function(_$_AnalyticsItem) _then)
      : super(_value, (v) => _then(v as _$_AnalyticsItem));

  @override
  _$_AnalyticsItem get _value => super._value as _$_AnalyticsItem;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? userId = freezed,
    Object? data = freezed,
  }) {
    return _then(_$_AnalyticsItem(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<AnalyticsItemDetails>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AnalyticsItem extends _AnalyticsItem {
  const _$_AnalyticsItem(
      {required this.id,
      required this.name,
      required this.description,
      this.userId,
      @JsonKey(fromJson: AnalyticsItem._fromJsonData, toJson: AnalyticsItem._toJsonData)
          required this.data})
      : super._();

  factory _$_AnalyticsItem.fromJson(Map<String, dynamic> json) =>
      _$$_AnalyticsItemFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final String? userId;
  @override
  @JsonKey(
      fromJson: AnalyticsItem._fromJsonData, toJson: AnalyticsItem._toJsonData)
  final List<AnalyticsItemDetails> data;

  @override
  String toString() {
    return 'AnalyticsItem(id: $id, name: $name, description: $description, userId: $userId, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AnalyticsItem &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  _$$_AnalyticsItemCopyWith<_$_AnalyticsItem> get copyWith =>
      __$$_AnalyticsItemCopyWithImpl<_$_AnalyticsItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AnalyticsItemToJson(this);
  }
}

abstract class _AnalyticsItem extends AnalyticsItem {
  const factory _AnalyticsItem(
      {required final String id,
      required final String name,
      required final String description,
      final String? userId,
      @JsonKey(fromJson: AnalyticsItem._fromJsonData, toJson: AnalyticsItem._toJsonData)
          required final List<AnalyticsItemDetails> data}) = _$_AnalyticsItem;
  const _AnalyticsItem._() : super._();

  factory _AnalyticsItem.fromJson(Map<String, dynamic> json) =
      _$_AnalyticsItem.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get description => throw _privateConstructorUsedError;
  @override
  String? get userId => throw _privateConstructorUsedError;
  @override
  @JsonKey(
      fromJson: AnalyticsItem._fromJsonData, toJson: AnalyticsItem._toJsonData)
  List<AnalyticsItemDetails> get data => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_AnalyticsItemCopyWith<_$_AnalyticsItem> get copyWith =>
      throw _privateConstructorUsedError;
}

AnalyticsItemDetails _$AnalyticsItemDetailsFromJson(Map<String, dynamic> json) {
  return _AnalyticsItemDetails.fromJson(json);
}

/// @nodoc
mixin _$AnalyticsItemDetails {
  double get accuracy => throw _privateConstructorUsedError;
  double get meanAccuracy => throw _privateConstructorUsedError;
  Duration get duration => throw _privateConstructorUsedError;
  DateTime get startTime => throw _privateConstructorUsedError;
  DateTime get endTime => throw _privateConstructorUsedError;
  int get totalPoints => throw _privateConstructorUsedError;
  int get totalErrors => throw _privateConstructorUsedError;
  int get totalRetries => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnalyticsItemDetailsCopyWith<AnalyticsItemDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalyticsItemDetailsCopyWith<$Res> {
  factory $AnalyticsItemDetailsCopyWith(AnalyticsItemDetails value,
          $Res Function(AnalyticsItemDetails) then) =
      _$AnalyticsItemDetailsCopyWithImpl<$Res>;
  $Res call(
      {double accuracy,
      double meanAccuracy,
      Duration duration,
      DateTime startTime,
      DateTime endTime,
      int totalPoints,
      int totalErrors,
      int totalRetries});
}

/// @nodoc
class _$AnalyticsItemDetailsCopyWithImpl<$Res>
    implements $AnalyticsItemDetailsCopyWith<$Res> {
  _$AnalyticsItemDetailsCopyWithImpl(this._value, this._then);

  final AnalyticsItemDetails _value;
  // ignore: unused_field
  final $Res Function(AnalyticsItemDetails) _then;

  @override
  $Res call({
    Object? accuracy = freezed,
    Object? meanAccuracy = freezed,
    Object? duration = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? totalPoints = freezed,
    Object? totalErrors = freezed,
    Object? totalRetries = freezed,
  }) {
    return _then(_value.copyWith(
      accuracy: accuracy == freezed
          ? _value.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as double,
      meanAccuracy: meanAccuracy == freezed
          ? _value.meanAccuracy
          : meanAccuracy // ignore: cast_nullable_to_non_nullable
              as double,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      startTime: startTime == freezed
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: endTime == freezed
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      totalPoints: totalPoints == freezed
          ? _value.totalPoints
          : totalPoints // ignore: cast_nullable_to_non_nullable
              as int,
      totalErrors: totalErrors == freezed
          ? _value.totalErrors
          : totalErrors // ignore: cast_nullable_to_non_nullable
              as int,
      totalRetries: totalRetries == freezed
          ? _value.totalRetries
          : totalRetries // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_AnalyticsItemDetailsCopyWith<$Res>
    implements $AnalyticsItemDetailsCopyWith<$Res> {
  factory _$$_AnalyticsItemDetailsCopyWith(_$_AnalyticsItemDetails value,
          $Res Function(_$_AnalyticsItemDetails) then) =
      __$$_AnalyticsItemDetailsCopyWithImpl<$Res>;
  @override
  $Res call(
      {double accuracy,
      double meanAccuracy,
      Duration duration,
      DateTime startTime,
      DateTime endTime,
      int totalPoints,
      int totalErrors,
      int totalRetries});
}

/// @nodoc
class __$$_AnalyticsItemDetailsCopyWithImpl<$Res>
    extends _$AnalyticsItemDetailsCopyWithImpl<$Res>
    implements _$$_AnalyticsItemDetailsCopyWith<$Res> {
  __$$_AnalyticsItemDetailsCopyWithImpl(_$_AnalyticsItemDetails _value,
      $Res Function(_$_AnalyticsItemDetails) _then)
      : super(_value, (v) => _then(v as _$_AnalyticsItemDetails));

  @override
  _$_AnalyticsItemDetails get _value => super._value as _$_AnalyticsItemDetails;

  @override
  $Res call({
    Object? accuracy = freezed,
    Object? meanAccuracy = freezed,
    Object? duration = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? totalPoints = freezed,
    Object? totalErrors = freezed,
    Object? totalRetries = freezed,
  }) {
    return _then(_$_AnalyticsItemDetails(
      accuracy: accuracy == freezed
          ? _value.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as double,
      meanAccuracy: meanAccuracy == freezed
          ? _value.meanAccuracy
          : meanAccuracy // ignore: cast_nullable_to_non_nullable
              as double,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      startTime: startTime == freezed
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: endTime == freezed
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      totalPoints: totalPoints == freezed
          ? _value.totalPoints
          : totalPoints // ignore: cast_nullable_to_non_nullable
              as int,
      totalErrors: totalErrors == freezed
          ? _value.totalErrors
          : totalErrors // ignore: cast_nullable_to_non_nullable
              as int,
      totalRetries: totalRetries == freezed
          ? _value.totalRetries
          : totalRetries // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AnalyticsItemDetails implements _AnalyticsItemDetails {
  const _$_AnalyticsItemDetails(
      {required this.accuracy,
      required this.meanAccuracy,
      required this.duration,
      required this.startTime,
      required this.endTime,
      required this.totalPoints,
      required this.totalErrors,
      required this.totalRetries});

  factory _$_AnalyticsItemDetails.fromJson(Map<String, dynamic> json) =>
      _$$_AnalyticsItemDetailsFromJson(json);

  @override
  final double accuracy;
  @override
  final double meanAccuracy;
  @override
  final Duration duration;
  @override
  final DateTime startTime;
  @override
  final DateTime endTime;
  @override
  final int totalPoints;
  @override
  final int totalErrors;
  @override
  final int totalRetries;

  @override
  String toString() {
    return 'AnalyticsItemDetails(accuracy: $accuracy, meanAccuracy: $meanAccuracy, duration: $duration, startTime: $startTime, endTime: $endTime, totalPoints: $totalPoints, totalErrors: $totalErrors, totalRetries: $totalRetries)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AnalyticsItemDetails &&
            const DeepCollectionEquality().equals(other.accuracy, accuracy) &&
            const DeepCollectionEquality()
                .equals(other.meanAccuracy, meanAccuracy) &&
            const DeepCollectionEquality().equals(other.duration, duration) &&
            const DeepCollectionEquality().equals(other.startTime, startTime) &&
            const DeepCollectionEquality().equals(other.endTime, endTime) &&
            const DeepCollectionEquality()
                .equals(other.totalPoints, totalPoints) &&
            const DeepCollectionEquality()
                .equals(other.totalErrors, totalErrors) &&
            const DeepCollectionEquality()
                .equals(other.totalRetries, totalRetries));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(accuracy),
      const DeepCollectionEquality().hash(meanAccuracy),
      const DeepCollectionEquality().hash(duration),
      const DeepCollectionEquality().hash(startTime),
      const DeepCollectionEquality().hash(endTime),
      const DeepCollectionEquality().hash(totalPoints),
      const DeepCollectionEquality().hash(totalErrors),
      const DeepCollectionEquality().hash(totalRetries));

  @JsonKey(ignore: true)
  @override
  _$$_AnalyticsItemDetailsCopyWith<_$_AnalyticsItemDetails> get copyWith =>
      __$$_AnalyticsItemDetailsCopyWithImpl<_$_AnalyticsItemDetails>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AnalyticsItemDetailsToJson(this);
  }
}

abstract class _AnalyticsItemDetails implements AnalyticsItemDetails {
  const factory _AnalyticsItemDetails(
      {required final double accuracy,
      required final double meanAccuracy,
      required final Duration duration,
      required final DateTime startTime,
      required final DateTime endTime,
      required final int totalPoints,
      required final int totalErrors,
      required final int totalRetries}) = _$_AnalyticsItemDetails;

  factory _AnalyticsItemDetails.fromJson(Map<String, dynamic> json) =
      _$_AnalyticsItemDetails.fromJson;

  @override
  double get accuracy => throw _privateConstructorUsedError;
  @override
  double get meanAccuracy => throw _privateConstructorUsedError;
  @override
  Duration get duration => throw _privateConstructorUsedError;
  @override
  DateTime get startTime => throw _privateConstructorUsedError;
  @override
  DateTime get endTime => throw _privateConstructorUsedError;
  @override
  int get totalPoints => throw _privateConstructorUsedError;
  @override
  int get totalErrors => throw _privateConstructorUsedError;
  @override
  int get totalRetries => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_AnalyticsItemDetailsCopyWith<_$_AnalyticsItemDetails> get copyWith =>
      throw _privateConstructorUsedError;
}
