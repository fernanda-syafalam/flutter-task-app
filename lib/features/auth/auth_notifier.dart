import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_app/features/auth/auth_state.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(const AuthState(isLoggedIn: false));

  void login() {
    state = const AuthState(isLoggedIn: true);
  }

  void logout() {
    state = const AuthState(isLoggedIn: false);
  }
}
