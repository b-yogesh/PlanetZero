class MeasuredActivity {
  final int id;
  final String type;
  final int confidence;
  final DateTime timestamp;

  MeasuredActivity({this.id, this.type, this.confidence, this.timestamp});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'type': type,
      'confidence': confidence,
      'timestamp': timestamp.toString(),
    };
  }

  static String createSQL() {
    return """
      CREATE TABLE measuredActivities (
        id INTEGER PRIMARY KEY, 
        type TEXT,
        confidence INTEGER,
        timestamp TEXT
      );
    """;
  }

  static MeasuredActivity fromMap(Map<String, dynamic> map) {
    return MeasuredActivity(
      id: map['id'],
      type: map['type'],
      confidence: map['confidence'],
      timestamp: DateTime.parse(map['timestamp']),
    );
  }
}
