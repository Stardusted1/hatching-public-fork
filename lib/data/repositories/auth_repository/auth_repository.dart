import 'package:hatching/domain/auth_user/auth_user.cg.dart';

abstract class IAuthRepository {
  Future<AuthUser> signInWithGoogle(String uid);
}
