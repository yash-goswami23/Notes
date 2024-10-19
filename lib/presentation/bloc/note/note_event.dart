import 'package:equatable/equatable.dart';
import 'package:todolist_bloc/domain/entities/note.dart';

class NoteEvent extends Equatable {
  const NoteEvent();
  @override
  List<Object?> get props => [];
}

class AddNoteEvent extends NoteEvent {
  final Note note;
  const AddNoteEvent(this.note);
}

class DeleteNoteEvent extends NoteEvent {
  final int id;
  const DeleteNoteEvent(this.id);
}

class CompleteNoteEvent extends NoteEvent {
  final Note note;
  const CompleteNoteEvent(this.note);
}

class LoadNoteEvent extends NoteEvent {}
