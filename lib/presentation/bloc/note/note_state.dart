import 'package:equatable/equatable.dart';
import 'package:todolist_bloc/utils/responce/note_responce.dart';
import 'package:todolist_bloc/utils/responce/to_do_responce.dart';

class NoteState extends Equatable {
  final NoteResponce noteResponce;

  const NoteState(
      {this.noteResponce = const NoteResponce(status: Status.loading)});

  NoteState copyWith({NoteResponce? noteResponce}) {
    return NoteState(noteResponce: noteResponce ?? this.noteResponce);
  }

  @override
  List<Object?> get props => [noteResponce];
}
