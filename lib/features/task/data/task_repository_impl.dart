import 'package:task_app/features/task/data/task_api.dart';
import 'package:task_app/features/task/domain/task.dart';
import 'package:task_app/models/task.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskApi api;

  TaskRepositoryImpl(this.api);

  @override
  Future<void> addTask(Task task) => api.addTask(task);

  @override
  Future<void> deleteTask(int index) => api.deleteTask(index);

  @override
  Future<List<Task>> getTasks() => api.getTasks();

  @override
  Future<void> updateTask(int index, Task task) => api.updateTask(index, task);
}
