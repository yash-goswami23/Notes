import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist_bloc/presentation/bloc/note/note_bloc.dart';
import 'package:todolist_bloc/presentation/bloc/todo/todo_bloc.dart';
import 'package:todolist_bloc/presentation/bloc/main/main_bloc.dart';
import 'package:todolist_bloc/presentation/pages/main/main_page.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => ToDoBloc(),
    ),
    BlocProvider(
      create: (context) => MainBloc(),
    ),
    BlocProvider(
      create: (context) => NoteBloc(),
    ),
  ], child: const MainApp()));
}
