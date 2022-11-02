import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hatching/data/repositories/auth_repository/auth_repository.dart';
import 'package:hatching/domain/auth_user/auth_user.cg.dart';

class FirebaseAuthRepository implements IAuthRepository {
  FirebaseFirestore firebase = FirebaseFirestore.instance;

  @override
  Future<AuthUser> signInWithGoogle(String uid) {
    throw UnimplementedError();
  }
}
