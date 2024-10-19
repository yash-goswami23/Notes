import 'package:todolist_bloc/data/data_sources/note_local_data_sources.dart';
import 'package:todolist_bloc/data/models/note_model.dart';
import 'package:todolist_bloc/utils/responce/to_do_responce.dart';

import '../../data/repositories/note_repository_impl.dart';
import '../../utils/responce/note_responce.dart';
import '../entities/note.dart';

class NoteRepository extends NoteRepositoryImpl {
  NoteLocalDataSource localDB = NoteLocalDataSource.instance;

  @override
  Future<NoteResponce> addNote(NoteModel values) async {
    try {
      return localDB.insertDatabase(values).then(
        (value) {
          return const NoteResponce(status: Status.success);
        },
      ).onError(
        (error, stackTrace) {
          throw "$error";
        },
      );
    } catch (e) {
      return NoteResponce(status: Status.failure, error: "$e");
    }
  }

  @override
  Future<NoteResponce> deleteNote(int id) async {
    try {
      return await localDB.deleteDatabase(id).then(
        (value) {
          return const NoteResponce(status: Status.success);
        },
      ).onError(
        (error, stackTrace) {
          throw "$error";
        },
      );
    } catch (e) {
      return NoteResponce(status: Status.failure, error: "$e");
    }
  }

  @override
  isFavNote(NoteModel values) async {
    try {
      return await localDB.updateDatabase(values).then(
        (value) {
          return const NoteResponce(status: Status.success);
        },
      ).onError(
        (error, stackTrace) {
          throw "$error";
        },
      );
    } catch (e) {
      return NoteResponce(status: Status.failure, error: "$e");
    }
  }

  @override
  Future<NoteResponce> loadNote() async {
    NoteResponce responce;
    try {
      return await localDB.loadDatabase().then(
        (values) {
          if (values.isNotEmpty) {
            List<Note> noteList = [];
            for (NoteModel value in values) {
              Note item = Note(
                  title: value.title,
                  id: value.id,
                  isFav: value.isFav,
                  desc: value.desc);
              noteList.add(item);
            }
            responce = NoteResponce(status: Status.success, noteList: noteList);
            return responce;
          } else {
            responce = const NoteResponce(status: Status.noData);
            return responce;
          }
        },
      ).onError(
        (error, stackTrace) {
          throw "$error";
        },
      );
    } catch (e) {
      return NoteResponce(status: Status.failure, error: "$e");
    }
  }
}
