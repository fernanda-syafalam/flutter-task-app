class Task {
  final String title;
  final bool isComplete;

  Task({required this.title, this.isComplete = false});

  Task copyWith({String? title, bool? isComplete}) {
    return Task(
      title: title ?? this.title,
      isComplete: isComplete ?? this.isComplete,
    );
  }
}
