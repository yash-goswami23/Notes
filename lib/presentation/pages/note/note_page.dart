import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist_bloc/domain/entities/note.dart';
import 'package:todolist_bloc/presentation/bloc/note/note_bloc.dart';
import 'package:todolist_bloc/presentation/bloc/note/note_event.dart';
import 'package:todolist_bloc/presentation/bloc/note/note_state.dart';
import 'package:todolist_bloc/utils/responce/to_do_responce.dart';
import 'package:todolist_bloc/utils/util/show_toast.dart';
import '../../widgets/component/list_card.dart';
import '../../widgets/component/my_dailog.dart';

class NotePage extends StatelessWidget {
  const NotePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<NoteBloc>().add(LoadNoteEvent());

    TextEditingController addNoteTitleController = TextEditingController();
    TextEditingController addNoteDescController = TextEditingController();

    return Scaffold(
      body: BlocBuilder<NoteBloc, NoteState>(
        builder: (context, state) {
          switch (state.noteResponce.status) {
            case Status.loading:
              return Center(
                  child: Platform.isAndroid
                      ? const CircularProgressIndicator()
                      : const CupertinoActivityIndicator());
            case Status.success:
              return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: state.noteResponce.noteList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        addNoteTitleController.text =
                            state.noteResponce.noteList[index].title;

                        addNoteDescController.text =
                            state.noteResponce.noteList[index].desc;
                        showDialog(
                            context: context,
                            builder: (context) => myDialog(
                                context: context,
                                addTitlController: addNoteTitleController,
                                addDescController: addNoteDescController,
                                onYesPressed: () {
                                  if (addNoteTitleController.text.isEmpty) {
                                    showToast("Enter Some Note");
                                  } else {
                                    Note note = Note(
                                        id: state
                                            .noteResponce.noteList[index].id,
                                        title: addNoteTitleController.text,
                                        desc: addNoteDescController.text,
                                        isFav: state.noteResponce
                                            .noteList[index].isFav);
                                    context
                                        .read<NoteBloc>()
                                        .add(CompleteNoteEvent(note));
                                    Navigator.pop(context);
                                    showToast("Add Successfull");
                                    addNoteTitleController.clear();
                                    addNoteDescController.clear();
                                  }
                                }));
                      },
                      child: noteListCard(
                          context: context,
                          note: state.noteResponce.noteList[index],
                          onChange: () {
                            Note note = Note(
                                id: state.noteResponce.noteList[index].id,
                                title: state.noteResponce.noteList[index].title,
                                desc: state.noteResponce.noteList[index].desc,
                                isFav:
                                    !state.noteResponce.noteList[index].isFav);
                            context
                                .read<NoteBloc>()
                                .add(CompleteNoteEvent(note));
                          },
                          onDelete: () {
                            context.read<NoteBloc>().add(DeleteNoteEvent(
                                state.noteResponce.noteList[index].id!));
                          }),
                    );
                  });
            case Status.failure:
              return Center(
                  child: Text(
                state.noteResponce.error,
                style: Theme.of(context).textTheme.titleMedium,
              ));
            default:
              return Center(
                  child: Text(
                "Add Some Notes",
                style: Theme.of(context).textTheme.titleMedium,
              ));
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
                  addTitlController: addNoteTitleController,
                  addDescController: addNoteDescController,
                  onYesPressed: () {
                    if (addNoteTitleController.text.isEmpty) {
                      showToast("Enter Some Note");
                    } else {
                      // Task task = Task(title: addTaskController.text);
                      context.read<NoteBloc>().add(AddNoteEvent(Note(
                            title: addNoteTitleController.text,
                            desc: addNoteDescController.text,
                          )));
                      Navigator.pop(context);
                      showToast("Add Successfull");
                      addNoteTitleController.dispose();
                      addNoteDescController.dispose();
                    }
                  }));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
