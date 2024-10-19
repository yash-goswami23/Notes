import 'package:todolist_bloc/data/models/note_model.dart';
import 'package:todolist_bloc/domain/entities/note.dart';
import 'package:todolist_bloc/domain/repositories/note_repository.dart';
import 'package:todolist_bloc/utils/responce/note_responce.dart';

class UpdateNoteUseCase {
  NoteRepository noteRepository = NoteRepository();
  Future<NoteResponce> favNote(Note note) async {
    NoteModel noteModel = NoteModel(
        id: note.id, title: note.title, desc: note.desc, isFav: note.isFav);
    return await noteRepository.isFavNote(noteModel);
  }
}
