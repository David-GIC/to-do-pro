import 'package:check_list_app/models/to_do.dart';
import 'package:flutter/material.dart';

class ToDoProvider with ChangeNotifier {
  List<ToDo> _toDoList = [];

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

  void sortByPriority() {
    _toDoList.sort((a, b) => a.priority == b.priority ? 0 : (a.priority ? -1 : 1));
    notifyListeners();
  }
}
