import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_user.cg.freezed.dart';
part 'auth_user.cg.g.dart';

@freezed
class AuthUser with _$AuthUser {
  factory AuthUser({
    required String id,
    required String name,
  }) = _AuthUser;

  factory AuthUser.fromJson(Map<String, dynamic> json) =>
      _$AuthUserFromJson(json);
}
