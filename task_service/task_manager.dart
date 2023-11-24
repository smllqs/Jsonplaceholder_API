import 'task_data.dart';
import 'task_model.dart';

class TaskManager {
  List<Map<String, dynamic>> _data = [];
  List<Task> _tasks = [];

  TaskManager.convert(List<dynamic> data) {
    for (var element in data) {
      _data.add(element);
    }
    initialiseTasks();
  }

  void initialiseTasks() {
    for (var element in _data) {
      final task = Task.fromJson(element);
      _tasks.add(task);
    }
  }

  void printList() {
    print(_data);
  }

  void printTasks() {
    for (var element in _tasks) {
      print(element);
    }
  }
}

void main() async {
  final data = await TaskData().fetchdata();
  TaskManager manager = TaskManager.convert(data);
  manager.printTasks();
}
