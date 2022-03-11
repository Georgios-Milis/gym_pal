import "package:sembast/sembast.dart";

import "package:gym_pal/database/database.dart";
import "package:gym_pal/models/model.dart";

class DBLogic {
  static const String store = "workouts";

  final _workouts = intMapStoreFactory.store(store);

  Future<Database> get db async => await WorkoutDB.instance.db;

  Future insert(Workout workout) async {
    await _workouts.add(await db, workout.toMap());
  }

  Future update(Workout workout) async {
    final finder = Finder(filter: Filter.byKey(workout.id));
    await _workouts.update(await db, workout.toMap(), finder: finder);
  }

  Future delete(Workout workout) async {
    final finder = Finder(filter: Filter.byKey(workout.id));
    await _workouts.delete(await db, finder: finder);
  }

  Future<List<Workout>> getAllWorkouts() async {
    final recordSnapshots = await _workouts.find(await db);
    return recordSnapshots.map((snapshot) {
      final workout = Workout.fromMap(snapshot.value);
      workout.id = snapshot.key;
      return workout;
    }).toList();
  }

  Future deleteAll() async {
    await _workouts.delete(await db);
  }
}
