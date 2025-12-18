import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_app/features/task/domain/task.dart';
import 'package:task_app/features/task/task_state.dart';
import 'package:task_app/models/task.dart';

class TaskNotifier extends StateNotifier<TaskState> {
  final TaskRepository repository;
  TaskNotifier(this.repository) : super(const TaskState()) {
    loadTask();
  }

  Future<void> loadTask() async {
    state = state.copyWith(isLoading: true);
    try {
      final tasks = await repository.getTasks();
      state = state.copyWith(tasks: tasks, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: 'Failed to load tasks');
    }
  }

  void addTask() async {
    final newTask = Task(title: 'Task ${state.tasks.length + 1}');
    await repository.addTask(newTask);
    loadTask();
  }

  void toggleTask(int index) async {
    final task = state.tasks[index];
    final updated = task.copyWith(isComplete: !task.isComplete);
    await repository.updateTask(index, updated);
    loadTask();
  }

  Future<void> deleteTask(int index) async {
    await repository.deleteTask(index);
    loadTask();
  }
}
