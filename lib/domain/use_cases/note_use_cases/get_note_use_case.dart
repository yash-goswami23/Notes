import 'package:todolist_bloc/domain/repositories/note_repository.dart';

import '../../../utils/responce/note_responce.dart';

class GetNotesUseCase {
  NoteRepository noteRepository = NoteRepository();
  Future<NoteResponce> getNote() async {
    return noteRepository.loadNote();
  }
}
