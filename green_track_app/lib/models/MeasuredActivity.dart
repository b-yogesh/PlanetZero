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
      'timestamp': timestamp,
    };
  }
}