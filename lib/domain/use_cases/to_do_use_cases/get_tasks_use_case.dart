import 'package:todolist_bloc/domain/repositories/task_repository.dart';
import 'package:todolist_bloc/utils/responce/to_do_responce.dart';

class GetTasksUseCase {
  ToDoTaskRepository taskRepository = ToDoTaskRepository();
  Future<ToDoResponce> getTask() async {
    return taskRepository.loadTask();
  }
}
