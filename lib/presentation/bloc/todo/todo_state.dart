import 'package:equatable/equatable.dart';
import 'package:todolist_bloc/utils/responce/to_do_responce.dart';

class TodoState extends Equatable {
  final ToDoResponce responce;

  const TodoState({this.responce = const ToDoResponce(status: Status.loading)});

  TodoState copyWith({ToDoResponce? responce}) {
    return TodoState(responce: responce ?? this.responce);
  }

  @override
  List<Object?> get props => [responce];
}
