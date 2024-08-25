import 'package:check_list_app/models/to_do.dart';
import 'package:flutter/material.dart';

class ToDoProvider with ChangeNotifier {
  final List<ToDo> _toDoList = [
    ToDo(
        title: "My Task 1",
        description: "Simple task 1",
        priority: false,
        createdDate: DateTime.now()),
    ToDo(
        title: "My Task 2",
        description: "Simple task 2",
        priority: false,
        createdDate: DateTime.now(),
        isCompleted: true),
    ToDo(
        title: "My Task 3",
        description: "Simple task 1",
        priority: false,
        createdDate: DateTime.now(),
        isCompleted: true),
    ToDo(
        title: "My Task 4",
        description: "Simple task 2",
        priority: false,
        createdDate: DateTime.now()),
    ToDo(
        title: "My Task 5",
        description: "Urgent task 1",
        priority: true,
        createdDate: DateTime.now()),
    ToDo(
        title: "My Task 6",
        description: "Urgent task 2",
        priority: true,
        createdDate: DateTime.now())
  ];

  List<ToDo> get toDoList => _toDoList;

  void addToDo(ToDo toDo) {
    _toDoList.add(toDo);
    notifyListeners();
  }

  void updateToDo(int index, ToDo toDo) {
    _toDoList[index] = toDo;
    notifyListeners();
  }

  void deleteToDo(int index) {
    _toDoList.removeAt(index);
    notifyListeners();
  }

  void toggleCompletion(int index) {
    _toDoList[index].isCompleted = !_toDoList[index].isCompleted;
    notifyListeners();
  }

  void sortToDoByCreatedDate() {
    _toDoList.sort((a, b) => b.createdDate.compareTo(a.createdDate));
    notifyListeners();
  }

  void sortByCompleted() {
    _toDoList.sort((a, b) =>
        a.isCompleted == b.isCompleted ? 0 : (a.isCompleted ? -1 : 1));
    notifyListeners();
  }

  void sortByPending() {
    _toDoList.sort((a, b) =>
        a.isCompleted == b.isCompleted ? 0 : (a.isCompleted ? 1 : -1));
    notifyListeners();
  }

  void sortByPriority() {
    _toDoList
        .sort((a, b) => a.priority == b.priority ? 0 : (a.priority ? -1 : 1));
    notifyListeners();
  }
}
