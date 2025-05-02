class TodoItem {
  TodoItem(
      {required this.title,
      required this.date,
      required this.status,
      required this.subtasks});
  final String title;
  final DateTime date;
  bool status;
  final List<SubTask> subtasks;

  String get getTitle {
    return title;
  }

  DateTime get getDueDate {
    return date;
  }

  bool get getStatus {
    return status;
  }

  void changeStatus() {
    status = !status;
  }
}

class SubTask {
  SubTask({required this.title, required this.status});

  final String title;
  bool status;

  bool get getStatus {
    return status;
  }

  String get getTitle {
    return title;
  }

  void changeStatus() {
    status = !status;
  }
}
