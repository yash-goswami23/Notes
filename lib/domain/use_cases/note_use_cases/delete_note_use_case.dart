import 'package:todolist_bloc/domain/repositories/note_repository.dart';

import '../../../utils/responce/note_responce.dart';

class DeleteNoteUseCase {
  NoteRepository noteRepository = NoteRepository();

  Future<NoteResponce> deleteNote(int id) async {
    return await noteRepository.deleteNote(id).then(
      (value) {
        return value;
      },
    );
  }
}
