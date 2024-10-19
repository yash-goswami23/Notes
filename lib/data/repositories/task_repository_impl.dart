import 'package:todolist_bloc/data/models/task_model.dart';
import 'package:todolist_bloc/utils/responce/to_do_responce.dart';

abstract class TaskRepositoryImpl {
  Future<ToDoResponce> addTask(TaskModel taskModel);
  Future<ToDoResponce> deleteTask(int id);
  isCompleteTask(TaskModel values);
  Future<ToDoResponce> loadTask();
}
