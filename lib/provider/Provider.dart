import 'package:flutter/material.dart';

class ListProvider extends ChangeNotifier {
  List<TodoDM> todos = [];
  DateTime selectedDate = DateTime.now();

  refreshTodosList() async {
    print("Getting todos");
    todos = [];

    todos = mockTodos.where((todo) {
      return todo.date.day == selectedDate.day &&
          todo.date.month == selectedDate.month &&
          todo.date.year == selectedDate.year;
    }).toList();

    notifyListeners();
  }

  Future<void> clickOnIsDone(TodoDM todoDM) async {

    int index = todos.indexWhere((todo) => todo.id == todoDM.id);
    if (index != -1) {
      todos[index] = todoDM;
    }

    refreshTodosList();
  }

  clickOnDelete(String taskId) async {
    todos.removeWhere((todo) => todo.id == taskId);

    refreshTodosList();
  }
}

final List<TodoDM> mockTodos = [
  TodoDM(id: "1", title: "Task 1", date: DateTime.now(), isDone: false, description: ''),
  TodoDM(id: "2", title: "Task 2", date: DateTime.now().add(Duration(days: 1)), isDone: true, description: ''),
];

class TodoDM {
  String id;
  String title;
  String description;
  DateTime date;
  bool isDone;

  TodoDM({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.isDone,
  });

  factory TodoDM.fromJson(Map<String, dynamic> json) {
    return TodoDM(
      id: json['id'] as String,
      title: json['title'] as String,
      date: DateTime.parse(json['date'] as String),
      isDone: json['isDone'] as bool, description: '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'date': date.toIso8601String(),
      'isDone': isDone,
    };
  }
}