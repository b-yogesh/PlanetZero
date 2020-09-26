class MeasuredLocation {
  final int id;
  final double latitude;
  final double longitude;
  final double altitude;
  final double heading;
  final double accuracy;
  final DateTime timestamp;

  MeasuredLocation(
      {this.id,
      this.latitude,
      this.longitude,
      this.altitude,
      this.heading,
      this.accuracy,
      this.timestamp});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'latitude': latitude,
      'longitude': longitude,
      'altitude': altitude,
      'heading': heading,
      'accuracy': accuracy,
      'timestamp': timestamp,
    };
  }
}