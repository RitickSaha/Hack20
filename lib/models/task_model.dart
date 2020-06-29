class TaskModel {
  final String title;
  final String description;
  final String imageUrl;
  final int points;
  final int duration;
  bool isFinished = false;

  TaskModel(
      {this.title,
      this.description,
      this.imageUrl,
      this.isFinished,
      this.duration,
      this.points});
}
