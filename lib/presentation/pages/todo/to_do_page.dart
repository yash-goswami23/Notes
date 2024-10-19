import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist_bloc/domain/entities/task.dart';
import 'package:todolist_bloc/utils/responce/to_do_responce.dart';
import 'package:todolist_bloc/utils/util/show_toast.dart';

import '../../bloc/todo/todo_bloc.dart';
import '../../bloc/todo/todo_event.dart';
import '../../bloc/todo/todo_state.dart';
import '../../widgets/component/list_card.dart';
import '../../widgets/component/my_dailog.dart';

class ToDoPage extends StatelessWidget {
  const ToDoPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController addTaskController = TextEditingController();
    context.read<ToDoBloc>().add(LoadTaskEvent());
    return Scaffold(
      body: BlocBuilder<ToDoBloc, TodoState>(
        builder: (context, state) {
          switch (state.responce.status) {
            case Status.loading:
              return Center(
                  child: Platform.isAndroid
                      ? const CircularProgressIndicator()
                      : const CupertinoActivityIndicator());

            case Status.success:
              return ListView.builder(
                  itemCount: state.responce.taskList.length,
                  itemBuilder: (context, index) {
                    return toDoListCard(
                        context: context,
                        task: state.responce.taskList[index],
                        onChange: (value) {
                          Task task = Task(
                              id: state.responce.taskList[index].id,
                              title: state.responce.taskList[index].title,
                              isCompleted:
                                  !state.responce.taskList[index].isCompleted);
                          context.read<ToDoBloc>().add(CompleteTaskEvent(task));
                        },
                        onDelete: () {
                          context.read<ToDoBloc>().add(DeleteTaskEvent(
                              state.responce.taskList[index].id!));
                        });
                  });
            case Status.failure:
              return Center(
                  child: Text(state.responce.error,
                      style: Theme.of(context).textTheme.titleMedium));
            default:
              return Center(
                  child: Text('Add Some Task',
                      style: Theme.of(context).textTheme.titleMedium));
          }
          // }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => myDialog(
                  context: context,
                  addTitlController: addTaskController,
                  onYesPressed: () {
                    if (addTaskController.text.isEmpty) {
                      showToast("Enter Some Task");
                    } else {
                      context.read<ToDoBloc>().add(
                          AddTaskEvent(Task(title: addTaskController.text)));
                      Navigator.pop(context);
                      showToast("Add Successfull");
                      addTaskController.clear();
                    }
                  }));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
