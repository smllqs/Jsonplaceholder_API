import 'dart:collection';

import 'task_data.dart';
import 'task_model.dart';

class TaskManager {
  List<Task> _tasks = [];

  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  Future<void> initialiseTasks() async {
    final data = await TaskData().fetchdata();
    for (var element in data) {
      final task = Task.fromJson(element);
      _tasks.add(task);
    }
  }

  void printTasks() {
    for (var element in _tasks) {
      print(element);
    }
  }
}

void main() async {
  TaskManager manager = TaskManager();
  await manager.initialiseTasks();
  print(manager.tasks);
}
