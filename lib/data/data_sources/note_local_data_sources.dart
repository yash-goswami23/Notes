// create a open data base

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todolist_bloc/data/models/note_model.dart';

class NoteLocalDataSource {
  static final NoteLocalDataSource instance = NoteLocalDataSource._instance();
  static Database? _database;

  NoteLocalDataSource._instance();

  Future<Database> get db async {
    _database ??= await _initDb();
    return _database!;
  }

  final String _nOTETABLE = "note_table";
  final String _nOTEID = "note_id";
  final String _tASKTITLE = "note_title";
  final String _nOTEDESC = "note_desc";
  final String _nOTEFAV = "note_fav";

  //create db
  Future<Database> _initDb() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'note.db');

    return await openDatabase(path, onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE $_nOTETABLE ($_nOTEID INTEGER PRIMARY KEY AUTOINCREMENT, $_tASKTITLE TEXT, $_nOTEDESC TEXT, $_nOTEFAV INTEGER)');
    }, version: 1);
  }

  //insert
  Future<int> insertDatabase(NoteModel values) async {
    Database db = await instance.db;
    return await db.insert(_nOTETABLE, values.toMap());
  }

  //load
  Future<List<NoteModel>> loadDatabase() async {
    Database db = await instance.db;
    List<Map<String, Object?>> values = await db.query(_nOTETABLE);
    List<NoteModel> noteList = [];
    for (var element in values) {
      noteList.add(NoteModel.fromMap(element));
    }
    return noteList;
  }

  //update
  Future<int> updateDatabase(NoteModel values) async {
    Database db = await instance.db;
    return await db.update(_nOTETABLE, values.toMap(),
        where: "$_nOTEID = ?", whereArgs: [values.id]);
  }

  //delete
  Future<int> deleteDatabase(int id) async {
    Database db = await instance.db;
    return await db.delete(_nOTETABLE, where: "$_nOTEID = ?", whereArgs: [id]);
  }
}
