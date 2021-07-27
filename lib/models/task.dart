class Task {
  final String? name;
  bool isDone;

  Task({this.name, this.isDone = false});

  bool toggleDone() {
    isDone = !isDone;
    return isDone;
  }

  Task.fromMap(Map map)
      : this.name = map['name'],
        this.isDone = map['isDone'];

  Map toMap() {
    return {
      'name': this.name,
      'isDone': this.isDone,
    };
  }
}
