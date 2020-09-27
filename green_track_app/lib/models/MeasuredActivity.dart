class MeasuredActivity {
  final int id;
  final String type;
  final int confidence;
  final DateTime timestamp;
  final bool parsed;

  MeasuredActivity({
    this.id,
    this.type,
    this.confidence,
    this.timestamp,
    this.parsed,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'type': type,
      'confidence': confidence,
      'timestamp': timestamp.toString(),
      'parsed': parsed,
    };
  }

  static String createSQL() {
    return """
      CREATE TABLE measuredActivities (
        id INTEGER PRIMARY KEY, 
        type TEXT,
        confidence INTEGER,
        timestamp TEXT,
        parsed BOOLEAN
      );
    """;
  }

  static String dropSQL() {
    return """
      DROP TABLE IF EXISTS measuredActivities;
    """;
  }

  static MeasuredActivity fromMap(Map<String, dynamic> map) {
    return MeasuredActivity(
      id: map['id'],
      type: map['type'],
      confidence: map['confidence'],
      timestamp: DateTime.parse(map['timestamp']),
      parsed: map['parsed'],
    );
  }
}
