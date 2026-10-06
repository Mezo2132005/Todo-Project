class TaskModel {
  final String? title;
  final String? details;
  final String? date;
  final String? time;
  final int? color;
  final String? status;

  TaskModel({
    required this.title,
    required this.details,
    required this.color,
    required this.status,
    required this.date,
    required this.time,
  });
}