import 'package:check_list_app/models/to_do.dart';
import 'package:check_list_app/providers/to_do.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ToDoProvider Tests', () {
    late ToDoProvider toDoProvider;

    setUp(() {
      toDoProvider = ToDoProvider();
    });

    test('Initial todo list is empty', () {
      expect(toDoProvider.toDoList.length, 6);
    });

    test('Add ToDo increases list length', () {
      final newItem = ToDo(title: 'Test Task', description: 'Task Description', priority: true, createdDate: DateTime.now());
      toDoProvider.addToDo(newItem);

      expect(toDoProvider.toDoList.length, 7);
      expect(toDoProvider.toDoList.last.title, 'Test Task');
    });

    test('Edit ToDo modifies the correct item', () {
      final editedItem =
          ToDo(title: 'Edited Task', description: 'Edited Description', priority: true, createdDate: DateTime.now(), isCompleted: true);
      toDoProvider.updateToDo(0, editedItem);

      expect(toDoProvider.toDoList[0].title, 'Edited Task');
      expect(toDoProvider.toDoList[0].description, 'Edited Description');
      expect(toDoProvider.toDoList[0].priority, true);
      expect(toDoProvider.toDoList[0].isCompleted, true);
    });

    test('Delete ToDo decreases list length', () {
      toDoProvider.deleteToDo(0);
      expect(toDoProvider.toDoList.length, 5);
    });

    test('Toggle completion status of a ToDo', () {
      final newItem = ToDo(title: 'Test Task', description: 'Task Description', priority: true, createdDate: DateTime.now(), isCompleted: false);
      toDoProvider.addToDo(newItem);
      expect(toDoProvider.toDoList.last.isCompleted, false);

      toDoProvider.toggleCompletion(toDoProvider.toDoList.length - 1);
      expect(toDoProvider.toDoList.last.isCompleted, true);
    });

    test('Sorting by pending works correctly', () {
      toDoProvider.sortByPending();
      expect(toDoProvider.toDoList[0].title, 'My Task 1');
      expect(toDoProvider.toDoList[1].title, 'My Task 4');
    });

    test('Sorting by completed works correctly', () {
      toDoProvider.sortByCompleted();
      expect(toDoProvider.toDoList[0].title, 'My Task 2');
      expect(toDoProvider.toDoList[1].title, 'My Task 3');
    });

    test('Sorting by priority works correctly', () {
      toDoProvider.sortByPriority();
      expect(toDoProvider.toDoList[0].title, 'My Task 5');
      expect(toDoProvider.toDoList[1].title, 'My Task 6');
    });

    test('Sorting by created date works correctly', () {
      toDoProvider.toDoList[0].createdDate = DateTime(2025);
      final newItem = ToDo(title: 'Test Task', description: 'Task Description', priority: true, createdDate: DateTime(2026), isCompleted: false);
      toDoProvider.toDoList.add(newItem);
      toDoProvider.sortToDoByCreatedDate();
      expect(toDoProvider.toDoList[0].title, 'Test Task');
      expect(toDoProvider.toDoList[1].title, 'My Task 1');
    });
  });
}
