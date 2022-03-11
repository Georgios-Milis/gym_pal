import "package:sembast/sembast.dart";
import "package:sembast/sembast_io.dart";
import "package:path_provider/path_provider.dart";

import "package:path/path.dart";
import "dart:async";

import "package:gym_pal/models/model.dart";

class WorkoutDB {
  WorkoutDB._internal();

  static WorkoutDB get instance => _singleton;

  static final WorkoutDB _singleton = WorkoutDB._internal();

  static late Database _db;

  Future<Database> get db async {
    _db = await initDB();
    return _db;
  }

  Future initDB() async {
    final documentDIR = await getApplicationDocumentsDirectory();
    final dbPath = join(documentDIR.path, "workout.db");
    final database = await databaseFactoryIo.openDatabase(dbPath);
    return database;
  }
}
