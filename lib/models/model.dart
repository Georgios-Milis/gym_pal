enum WorkoutsState { getAll, insert, update, delete, deleteAll, noOp }

class Workout {
  int id;

  WorkoutsState state;

  final bool timed;
  final String title;
  final int? sets;
  final int? reps;
  final Duration? duration;
  final bool coach;

  Workout(
      {required this.id,
      required this.state,
      required this.timed,
      required this.title,
      this.sets,
      this.reps,
      this.duration,
      required this.coach});

  Workout copyWith(
      {int? id,
      WorkoutsState? state,
      bool? timed,
      String? title,
      int? sets,
      int? reps,
      Duration? duration,
      bool? coach}) {
    return Workout(
        id: id ?? this.id,
        state: state ?? this.state,
        timed: timed ?? this.timed,
        title: title ?? this.title,
        sets: sets ?? this.sets,
        reps: reps ?? this.reps,
        duration: duration ?? this.duration,
        coach: coach ?? this.coach);
  }

  Workout.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        state = WorkoutsState.values[map['state']],
        timed = map['timed'],
        title = map['title'],
        sets = map['sets'],
        reps = map['reps'],
        duration = map['duration'],
        coach = map['coach'];

  Map<String, dynamic> toMap() => {
        'id': id,
        'state': state.index,
        'timed': timed,
        'title': title,
        'sets': sets,
        'reps': reps,
        'duration': duration,
        'coach': coach
      };
}
