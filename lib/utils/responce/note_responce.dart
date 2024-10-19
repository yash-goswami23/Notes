import 'package:equatable/equatable.dart';
import 'package:todolist_bloc/utils/responce/to_do_responce.dart';

import '../../domain/entities/note.dart';

class NoteResponce extends Equatable {
  final Status status;
  final List<Note> noteList;
  final String error;
  const NoteResponce({
    this.status = Status.noData,
    this.noteList = const [],
    this.error = "",
  });

  NoteResponce copyWith({
    Status? status,
    List<Note>? noteList,
    String? error,
  }) {
    return NoteResponce(
      status: status ?? this.status,
      noteList: noteList ?? this.noteList,
      error: error ?? this.error,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [status, noteList, error];
}
