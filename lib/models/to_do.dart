class ToDo {
  String title;
  String description;
  bool priority;
  bool isCompleted;
  DateTime createdDate;

  ToDo({required this.title, required this.description, required this.priority, this.isCompleted = false, required this.createdDate});
}
