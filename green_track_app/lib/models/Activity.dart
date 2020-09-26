class Activity {
  final int id;
  final String type;
  final DateTime start;
  final DateTime end;
  final double distance;

  Activity({this.id, this.type, this.start, this.end, this.distance});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'type': type,
      'start': start.toString(),
      'end': end.toString(),
      'distance': distance,
    };
  }

  Activity fromMap(Map<String, dynamic> map) {
    return Activity(
      id: map['id'],
      type: map['type'],
      start: DateTime.parse(map['start']),
      end: DateTime.parse(map['end']),
      distance: map['distance'],
    );
  }
}
