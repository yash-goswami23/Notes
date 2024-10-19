import 'package:todolist_bloc/data/models/note_model.dart';

import '../../utils/responce/note_responce.dart';

abstract class NoteRepositoryImpl {
  Future<NoteResponce> addNote(NoteModel values);
  Future<NoteResponce> deleteNote(int id);
  isFavNote(NoteModel values);
  Future<NoteResponce> loadNote();
}
