import 'dart:async';

import 'package:todolist_bloc/data/models/note_model.dart';
import 'package:todolist_bloc/domain/entities/note.dart';
import 'package:todolist_bloc/domain/repositories/note_repository.dart';
import 'package:todolist_bloc/utils/responce/note_responce.dart';
import 'package:todolist_bloc/utils/responce/to_do_responce.dart';

class AddNoteUseCase {
  NoteRepository noteRepository = NoteRepository();
  Future<NoteResponce> futureResponce =
      Future.value(const NoteResponce(status: Status.loading));

  Future<NoteResponce> addNote(Note note) {
    NoteModel noteModel =
        NoteModel(title: note.title, desc: note.desc, isFav: note.isFav);
    futureResponce = noteRepository.addNote(noteModel);
    return futureResponce;
  }
}
