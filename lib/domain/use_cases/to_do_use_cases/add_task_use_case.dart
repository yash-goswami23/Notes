import 'dart:async';

import 'package:todolist_bloc/data/models/task_model.dart';
import 'package:todolist_bloc/domain/entities/task.dart';
import 'package:todolist_bloc/domain/repositories/task_repository.dart';
import 'package:todolist_bloc/utils/responce/to_do_responce.dart';

class AddTaskUseCase {
  ToDoTaskRepository taskRepository = ToDoTaskRepository();
  Future<ToDoResponce> futureResponce =
      Future.value(const ToDoResponce(status: Status.loading));

  Future<ToDoResponce> addTask(Task task) {
    TaskModel taskModel = TaskModel(
        id: task.id, title: task.title, isCompleted: task.isCompleted);
    futureResponce = taskRepository.addTask(taskModel);
    return futureResponce;
  }
}
