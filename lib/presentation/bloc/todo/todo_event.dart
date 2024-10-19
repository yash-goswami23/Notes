import 'package:equatable/equatable.dart';
import 'package:todolist_bloc/domain/entities/task.dart';

class ToDoEvent extends Equatable {
  const ToDoEvent();
  @override
  List<Object?> get props => [];
}

class AddTaskEvent extends ToDoEvent {
  final Task task;
  const AddTaskEvent(this.task);
}

class DeleteTaskEvent extends ToDoEvent {
  final int id;
  const DeleteTaskEvent(this.id);
}

class CompleteTaskEvent extends ToDoEvent {
  final Task task;
  const CompleteTaskEvent(this.task);
}

class LoadTaskEvent extends ToDoEvent {}
