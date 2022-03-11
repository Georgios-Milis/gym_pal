import "dart:async";
import "package:gym_pal/models/model.dart";
import "package:gym_pal/database/crud.dart";

class WorkoutBloc {
  final DBLogic logic;
  StreamController<List<Workout>> _workouts = StreamController.broadcast();

  StreamController<Workout> _incoming = StreamController();

  Stream<List<Workout>> get outgoing => _workouts.stream;
  StreamSink<Workout> get inSink => _incoming.sink;

  WorkoutBloc(this.logic) {
    _incoming.stream.listen((workout) async {
      switch (workout.state) {
        case WorkoutsState.insert:
          logic.insert(workout).then((_) async {
            _workouts.add(await logic.getAllWorkouts());
          });
          break;
        case WorkoutsState.getAll:
          _workouts.add(await logic.getAllWorkouts());
          break;
        case WorkoutsState.update:
          logic.update(workout).then((_) async {
            _workouts.add(await logic.getAllWorkouts());
          });
          break;
        case WorkoutsState.delete:
          logic.delete(workout).then((_) async {
            _workouts.add(await logic.getAllWorkouts());
          });
          break;
        case WorkoutsState.deleteAll:
          logic.deleteAll().then((_) async {
            _workouts.add(await logic.getAllWorkouts());
          });
          break;
        case WorkoutsState.noOp:
          break;
      }
    });
  }

  void dispose() {
    _workouts.close();
    _incoming.close();
  }
}
