import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_app/features/task/task_state.dart';
import 'package:task_app/models/task.dart';

class TaskNotifier extends StateNotifier<TaskState> {
  TaskNotifier() : super(const TaskState());

  void addTask() {
    final newTask = Task(title: 'Task ${state.tasks.length + 1}');
    state = state.copyWith(tasks: [...state.tasks, newTask]);
  }

  void toggleTask(int index) {
    final updatedTask = [...state.tasks];
    updatedTask[index] = updatedTask[index].copyWith(
      isComplete: !updatedTask[index].isComplete,
    );
    state = state.copyWith(tasks: updatedTask);
  }
}
