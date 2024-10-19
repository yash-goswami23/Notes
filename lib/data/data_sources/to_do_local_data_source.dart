// create a open data base

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todolist_bloc/data/models/task_model.dart';

class ToDoLocalDataSource {
  static final ToDoLocalDataSource instance = ToDoLocalDataSource._instance();
  static Database? _database;

  ToDoLocalDataSource._instance();

  Future<Database> get db async {
    _database ??= await _initDb();
    return _database!;
  }

  final String _tASKTABLE = "task_table";
  final String _tASKID = "task_id";
  final String _tASKTITLE = "task_title";
  final String _tASKCOMPLETED = "task_completed";

  //create db
  Future<Database> _initDb() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'task.db');

    return await openDatabase(path, onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE $_tASKTABLE ($_tASKID INTEGER PRIMARY KEY AUTOINCREMENT, $_tASKTITLE TEXT, $_tASKCOMPLETED INTEGER)');
    }, version: 1);
  }

  //insert
  Future<int> insertDatabase(TaskModel values) async {
    Database db = await instance.db;
    return await db.insert(_tASKTABLE, values.toMap());
  }

  //load
  Future<List<TaskModel>> loadDatabase() async {
    Database db = await instance.db;
    List<Map<String, Object?>> values = await db.query(_tASKTABLE);
    List<TaskModel> taskList = [];
    for (var element in values) {
      taskList.add(TaskModel.fromMap(element));
    }
    return taskList;
  }

  //update
  Future<int> updateDatabase(TaskModel values) async {
    Database db = await instance.db;
    return await db.update(_tASKTABLE, values.toMap(),
        where: "$_tASKID = ?", whereArgs: [values.id]);
  }

  //delete
  Future<int> deleteDatabase(int id) async {
    Database db = await instance.db;
    return await db.delete(_tASKTABLE, where: "$_tASKID = ?", whereArgs: [id]);
  }
}
