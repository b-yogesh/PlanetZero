class ParsedActivity {
  final int id;
  final String type;
  final DateTime start;
  final DateTime end;
  final double distance;

  ParsedActivity({this.id, this.type, this.start, this.end, this.distance});

  getCategory() {
    switch (this.type) {
      case "Automotive":
      case "IN_VEHICLE":
        return "Killer";

      case "PUBLIC_TRANSPORT":
        return "Friendly";

      default:
        return "Neutral";
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'type': type,
      'start': start.toIso8601String(),
      'end': end.toIso8601String(),
      'distance': distance,
    };
  }

  static String createSQL() {
    return """
      CREATE TABLE parsedActivities (
        id INTEGER PRIMARY KEY, 
        type TEXT,
        start TEXT,
        end TEXT,
        distance REAL
      );
    """;
  }

  static String dropSQL() {
    return """
      DROP TABLE IF EXISTS parsedActivities;
    """;
  }

  static ParsedActivity fromMap(Map<String, dynamic> map) {
    return ParsedActivity(
      id: map['id'],
      type: map['type'],
      start: DateTime.parse(map['start']),
      end: DateTime.parse(map['end']),
      distance: map['distance'],
    );
  }
}
