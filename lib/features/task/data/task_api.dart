import 'package:task_app/models/task.dart';

class TaskApi {
  final List<Task> _fakeDb = [];

  Future<List<Task>> getTasks() async {
    await Future.delayed(const Duration(seconds: 1));
    return _fakeDb;
  }

  Future<void> addTask(Task task) async {
    await Future.delayed(const Duration(milliseconds: 500));
    _fakeDb.add(task);
  }

  Future<void> updateTask(int index, Task task) async {
    await Future.delayed(const Duration(milliseconds: 500));
    _fakeDb[index] = task;
  }

  Future<void> deleteTask(int index) async {
    await Future.delayed(const Duration(milliseconds: 500));
    _fakeDb.removeAt(index);
  }
}
