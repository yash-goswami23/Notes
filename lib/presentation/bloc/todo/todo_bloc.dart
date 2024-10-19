import 'package:bloc/bloc.dart';
import 'package:todolist_bloc/domain/use_cases/to_do_use_cases/add_task_use_case.dart';
import 'package:todolist_bloc/domain/use_cases/to_do_use_cases/delete_task_use_case.dart';
import 'package:todolist_bloc/domain/use_cases/to_do_use_cases/get_tasks_use_case.dart';
import 'package:todolist_bloc/domain/use_cases/to_do_use_cases/update_task_use_case.dart';
import 'package:todolist_bloc/presentation/bloc/todo/todo_event.dart';
import 'package:todolist_bloc/presentation/bloc/todo/todo_state.dart';
import 'package:todolist_bloc/utils/responce/to_do_responce.dart';

class ToDoBloc extends Bloc<ToDoEvent, TodoState> {
  ToDoResponce respo = const ToDoResponce();
  ToDoBloc() : super(const TodoState()) {
    on<AddTaskEvent>(_addTaskEvent);
    on<DeleteTaskEvent>(_deleteTaskEvent);
    on<LoadTaskEvent>(_loadTaskEvent);

    on<CompleteTaskEvent>(_completeTaskEvent);
  }
  _addTaskEvent(AddTaskEvent event, Emitter<TodoState> emit) async {
    respo = const ToDoResponce(status: Status.loading);
    respo = await AddTaskUseCase().addTask(event.task);
    switch (respo.status) {
      case Status.success:
        respo = await GetTasksUseCase().getTask();
        emit(state.copyWith(responce: respo));
        break;
      default:
        emit(state.copyWith(responce: respo));
    }
  }

  _deleteTaskEvent(DeleteTaskEvent event, Emitter<TodoState> emit) async {
    respo = await DeleteTaskUseCase().deleteTask(event.id);

    switch (respo.status) {
      case Status.success:
        respo = await GetTasksUseCase().getTask();
        emit(state.copyWith(responce: respo));
        break;
      default:
        emit(state.copyWith(responce: respo));
    }
  }

  _loadTaskEvent(LoadTaskEvent event, Emitter<TodoState> emit) async {
    respo = await GetTasksUseCase().getTask();
    switch (respo.status) {
      case Status.success:
        emit(state.copyWith(responce: respo));
        break;
      case Status.failure:
        emit(state.copyWith(responce: respo));
        break;

      default:
        respo = const ToDoResponce(status: Status.noData);
        emit(state.copyWith(responce: respo));
    }
  }

  _completeTaskEvent(CompleteTaskEvent event, Emitter<TodoState> emit) async {
    respo = await UpdateTaskUseCase().completeTask(event.task);
    emit(state.copyWith(responce: respo));

    switch (respo.status) {
      case Status.success:
        respo = await GetTasksUseCase().getTask();
        emit(state.copyWith(responce: respo));
        break;
      default:
        emit(state.copyWith(responce: respo));
    }
  }
}
