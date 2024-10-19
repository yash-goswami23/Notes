import 'package:todolist_bloc/data/data_sources/to_do_local_data_source.dart';
import 'package:todolist_bloc/data/models/task_model.dart';
import 'package:todolist_bloc/data/repositories/task_repository_impl.dart';
import 'package:todolist_bloc/domain/entities/task.dart';
import 'package:todolist_bloc/utils/responce/to_do_responce.dart';

class ToDoTaskRepository extends TaskRepositoryImpl {
  ToDoLocalDataSource localDB = ToDoLocalDataSource.instance;

  @override
  Future<ToDoResponce> addTask(TaskModel taskModel) async {
    try {
      return localDB.insertDatabase(taskModel).then(
        (value) {
          return const ToDoResponce(status: Status.success);
        },
      ).onError(
        (error, stackTrace) {
          throw "$error";
        },
      );
    } catch (e) {
      return ToDoResponce(status: Status.failure, error: "$e");
    }
  }

  @override
  Future<ToDoResponce> deleteTask(int id) async {
    try {
      return await localDB.deleteDatabase(id).then(
        (value) {
          return const ToDoResponce(status: Status.success);
        },
      ).onError(
        (error, stackTrace) {
          throw "$error";
        },
      );
    } catch (e) {
      return ToDoResponce(status: Status.failure, error: "$e");
    }
  }

  @override
  Future<ToDoResponce> isCompleteTask(TaskModel values) async {
    try {
      return await localDB.updateDatabase(values).then(
        (value) {
          return const ToDoResponce(status: Status.success);
        },
      ).onError(
        (error, stackTrace) {
          throw "$error";
        },
      );
    } catch (e) {
      return ToDoResponce(status: Status.failure, error: "$e");
    }
  }

  @override
  Future<ToDoResponce> loadTask() async {
    ToDoResponce responce;
    try {
      return localDB.loadDatabase().then(
        (values) {
          if (values.isNotEmpty) {
            List<Task> taskList = [];
            for (TaskModel value in values) {
              Task item = Task(
                  title: value.title,
                  id: value.id,
                  isCompleted: value.isCompleted);
              taskList.add(item);
            }
            responce = ToDoResponce(status: Status.success, taskList: taskList);
            return responce;
          } else {
            responce = const ToDoResponce(status: Status.noData);
            return responce;
          }
        },
      ).onError(
        (error, stackTrace) {
          return ToDoResponce(status: Status.failure, error: "$error");
        },
      );
    } catch (e) {
      return ToDoResponce(status: Status.failure, error: "$e");
    }
  }
}
