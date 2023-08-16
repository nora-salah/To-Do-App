class TaskModel {
  final String id;
  final String note;
  final String date;

  final String title;
  final String startTime;
  final String endTime;
  final bool isCompleted;
  final int color;

  TaskModel(
      {required this.id,
        required this.title,
        required this.date,
      required this.note,
      required this.startTime,
      required this.endTime,
      required this.isCompleted,
      required this.color});

}
