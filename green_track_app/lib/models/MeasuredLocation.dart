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

  MeasuredLocation({
    this.id,
    this.latitude,
    this.longitude,
    this.altitude,
    this.heading,
    this.accuracy,
    this.speed,
    this.speedAccuracy,
    this.timestamp,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'latitude': latitude,
      'longtitude': longitude,
      'altitude': altitude,
      'heading': heading,
      'accuracy': accuracy,
      'speed': speed,
      'speedAccuracy': speedAccuracy,
      'timestamp': timestamp.toIso8601String(),
    };
  }

  static String createSQL() {
    return """
      CREATE TABLE measuredLocations (
        id INTEGER PRIMARY KEY, 
        latitude REAL,
        longtitude REAL,
        altitude REAL,
        heading REAL,
        accuracy REAL,
        speed REAL,
        speedAccuracy REAL,
        timestamp TEXT
      );
    """;
  }

  static String dropSQL() {
    return """
      DROP TABLE IF EXISTS measuredLocations;
    """;
  }

  static MeasuredLocation fromMap(Map<String, dynamic> map) {
    return MeasuredLocation(
      id: map['id'],
      latitude: map['latitude'],
      longitude: map['longitude'],
      altitude: map['altitude'],
      heading: map['heading'],
      accuracy: map['accuracy'],
      speed: map['speed'],
      speedAccuracy: map['speedAccuracy'],
      timestamp: DateTime.parse(map['timestamp']),
    );
  }
}
