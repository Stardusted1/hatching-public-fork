import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthLogout()) {
    _authUser = FirebaseAuth.instance.currentUser;
  }

  User? _authUser;

  User? get authUser => _authUser;

  void login() async {
    emit(AuthLoading());
    try {
      final credential = await FirebaseAuth.instance
          .signInWithAuthProvider(GoogleAuthProvider());
      _authUser = credential.user!;
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(error: e.toString()));
    }
  }

  void logout() async {
    emit(AuthLoading());
    try {
      await FirebaseAuth.instance.signOut();
      emit(AuthLogout());
    } catch (e) {
      emit(AuthFailure(error: e.toString()));
    }
  }
}
