import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_app/features/auth/auth_notifier.dart';
import 'package:task_app/features/auth/auth_state.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) => AuthNotifier(),
);
