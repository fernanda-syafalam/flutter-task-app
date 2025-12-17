import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_app/features/task/task_notifier.dart';
import 'package:task_app/features/task/task_state.dart';

final taskProvider = StateNotifierProvider<TaskNotifier, TaskState>(
  (ref) => TaskNotifier(),
);
