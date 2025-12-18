import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_app/features/task/data/task_api.dart';
import 'package:task_app/features/task/data/task_repository_impl.dart';
import 'package:task_app/features/task/task_notifier.dart';
import 'package:task_app/features/task/task_state.dart';

final taskApiProvider = Provider((ref) => TaskApi());

final taskRepositoryProvider = Provider(
  (ref) => TaskRepositoryImpl(ref.read(taskApiProvider)),
);

final taskProvider = StateNotifierProvider<TaskNotifier, TaskState>(
  (ref) => TaskNotifier(ref.read(taskRepositoryProvider)),
);
