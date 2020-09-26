class MeasuredLocation {
  final int id;
  final double latitude;
  final double longitude;
  final double altitude;
  final double heading;
  final double accuracy;
  final double speed;
  final double speedAccuracy;
  final DateTime timestamp;

  MeasuredLocation(
      {this.id,
      this.latitude,
      this.longitude,
      this.altitude,
      this.heading,
      this.accuracy,
      this.speed,
      this.speedAccuracy,
      this.timestamp});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'latitude': latitude,
      'longitude': longitude,
      'altitude': altitude,
      'heading': heading,
      'accuracy': accuracy,
      'speed': speed,
      'speedAccuracy': speedAccuracy,
      'timestamp': timestamp,
    };
  }
}