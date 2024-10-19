import 'package:equatable/equatable.dart';
import 'package:todolist_bloc/domain/entities/task.dart';

enum Status { loading, success, failure, noData }

class ToDoResponce extends Equatable {
  final Status status;
  final List<Task> taskList;
  final String error;
  const ToDoResponce({
    this.status = Status.noData,
    this.taskList = const [],
    this.error = "",
  });

  ToDoResponce copyWith({
    Status? status,
    List<Task>? taskList,
    String? error,
  }) {
    return ToDoResponce(
      status: status ?? this.status,
      taskList: taskList ?? this.taskList,
      error: error ?? this.error,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [status, taskList, error];
}
