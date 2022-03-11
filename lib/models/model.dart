class Workout {
  int id;
  final bool timed;
  final String title;
  final int? sets;
  final int? reps;
  final Duration? duration;
  final bool coach;

  Workout(
      {required this.id,
      required this.timed,
      required this.title,
      this.sets,
      this.reps,
      this.duration,
      required this.coach});

  Workout.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        timed = map['timed'],
        title = map['title'],
        sets = map['sets'],
        reps = map['reps'],
        duration = map['duration'],
        coach = map['coach'];

  Map<String, dynamic> toMap() => {
        'id': id,
        'timed': timed,
        'title': title,
        'sets': sets,
        'reps': reps,
        'duration': duration,
        'coach': coach
      };
}
