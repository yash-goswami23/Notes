import 'package:bloc/bloc.dart';
import 'package:todolist_bloc/presentation/bloc/note/note_event.dart';
import 'package:todolist_bloc/presentation/bloc/note/note_state.dart';
import 'package:todolist_bloc/utils/responce/note_responce.dart';
import 'package:todolist_bloc/utils/responce/to_do_responce.dart';

import '../../../domain/use_cases/note_use_cases/add_note_use_case.dart';
import '../../../domain/use_cases/note_use_cases/delete_note_use_case.dart';
import '../../../domain/use_cases/note_use_cases/get_note_use_case.dart';
import '../../../domain/use_cases/note_use_cases/update_note_use_case.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  NoteResponce respo = const NoteResponce();
  NoteBloc() : super(const NoteState()) {
    on<AddNoteEvent>(_addNoteEvent);
    on<DeleteNoteEvent>(_deleteNoteEvent);
    on<LoadNoteEvent>(_loadNoteEvent);

    on<CompleteNoteEvent>(_completeNoteEvent);
  }
  _addNoteEvent(AddNoteEvent event, Emitter<NoteState> emit) async {
    respo = await AddNoteUseCase().addNote(event.note);

    switch (respo.status) {
      case Status.success:
        respo = await GetNotesUseCase().getNote();
        emit(state.copyWith(noteResponce: respo));
        break;
      default:
        emit(state.copyWith(noteResponce: respo));
    }
  }

  _deleteNoteEvent(DeleteNoteEvent event, Emitter<NoteState> emit) async {
    respo = await DeleteNoteUseCase().deleteNote(event.id);

    switch (respo.status) {
      case Status.success:
        respo = await GetNotesUseCase().getNote();
        emit(state.copyWith(noteResponce: respo));
        break;
      default:
        emit(state.copyWith(noteResponce: respo));
    }
  }

  _loadNoteEvent(LoadNoteEvent event, Emitter<NoteState> emit) async {
    respo = await GetNotesUseCase().getNote();
    emit(state.copyWith(noteResponce: respo));
  }

  _completeNoteEvent(CompleteNoteEvent event, Emitter<NoteState> emit) async {
    respo = await UpdateNoteUseCase().favNote(event.note);
    switch (respo.status) {
      case Status.success:
        emit(state.copyWith(noteResponce: respo));
        respo = await GetNotesUseCase().getNote();
        emit(state.copyWith(noteResponce: respo));
        break;
      default:
        emit(state.copyWith(noteResponce: respo));
    }
  }
}
