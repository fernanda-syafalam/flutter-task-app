import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_app/features/auth/auth_provider.dart';
import 'package:task_app/features/task/task_provider.dart';
import 'package:task_app/widgets/task_item.dart';

class TaskScreen extends ConsumerWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskState = ref.watch(taskProvider);
    final taskNotifier = ref.read(taskProvider.notifier);
    final authNotifier = ref.read(authProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Tasks'),
        actions: [
          IconButton(
            onPressed: authNotifier.logout,
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: taskState.tasks.isEmpty
          ? const Center(child: Text('No tasks yet'))
          : ListView.builder(
              itemCount: taskState.tasks.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: ValueKey(taskState.tasks[index].title),
                  onDismissed: (_)=> {
                    taskNotifier.deleteTask(index)
                  },
                  child: TaskItem(task: taskState.tasks[index], onTap: ()=> {
                    taskNotifier.toggleTask(index)
                  }),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: taskNotifier.addTask,
        child: const Icon(Icons.add),
      ),
    );
  }
}
