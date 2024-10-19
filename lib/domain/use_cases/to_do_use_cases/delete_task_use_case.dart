import 'package:todolist_bloc/domain/repositories/task_repository.dart';
import 'package:todolist_bloc/utils/responce/to_do_responce.dart';

class DeleteTaskUseCase {
  ToDoTaskRepository taskRepository = ToDoTaskRepository();

  Future<ToDoResponce> deleteTask(int id) async {
    return await taskRepository.deleteTask(id).then(
      (value) {
        return value;
      },
    );
  }
}
