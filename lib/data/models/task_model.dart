import 'package:equatable/equatable.dart';

class TaskModel extends Equatable {
  final int? id;
  final String title;
  final bool isCompleted;
  const TaskModel({
    this.id,
    required this.title,
    required this.isCompleted,
  });

  @override
  List<Object> get props => [id!, title, isCompleted];

  TaskModel copyWith({
    int? id,
    String? title,
    String? desc,
    bool? isCompleted,
  }) {
    return TaskModel(
      id: id ?? this.id,
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'task_id': id,
      'task_title': title,
      'task_completed': isCompleted ? 1 : 0,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map['task_id'] as int,
      title: map['task_title'] as String,
      isCompleted: map['task_completed'] as int == 0 ? false : true,
    );
  }

  @override
  bool get stringify => true;
}
