import 'package:todolist_bloc/domain/repositories/task_repository.dart';

import '../../../data/models/task_model.dart';
import '../../../utils/responce/to_do_responce.dart';
import '../../entities/task.dart';

class UpdateTaskUseCase {
  ToDoTaskRepository taskRepository = ToDoTaskRepository();
  Future<ToDoResponce> completeTask(Task task) async {
    TaskModel taskModel = TaskModel(
        id: task.id, title: task.title, isCompleted: task.isCompleted);
    return await taskRepository.isCompleteTask(taskModel);
  }
}
