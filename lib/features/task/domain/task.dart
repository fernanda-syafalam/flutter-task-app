import 'package:task_app/models/task.dart';

abstract class TaskRepository {
  Future<List<Task>> getTasks();
  Future<void> addTask(Task task);
  Future<void> updateTask(int index, Task task);
  Future<void> deleteTask(int index);
}
