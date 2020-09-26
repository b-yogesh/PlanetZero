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
      'start': start,
      'end': end,
      'distance': distance,
    };
  }
}