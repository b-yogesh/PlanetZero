import 'package:activity_recognition_flutter/activity_recognition_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:green_track_app/models/MeasuredActivity.dart';
import 'package:green_track_app/models/MeasuredLocation.dart';
import 'package:green_track_app/services/database.dart';

void startActivityMonitor() {
  WidgetsFlutterBinding.ensureInitialized();

  // Start the activity stream updates
  ActivityRecognition.activityUpdates().listen(onActivityData);

  // Start the position stream updates
  getPositionStream(desiredAccuracy: LocationAccuracy.high)
      .listen(onPositionData);
}

void onActivityData(Activity activity) async {
  // Do something with the activity
  var type = activity.type;
  var confidence = activity.confidence;

  var measuredActivity = MeasuredActivity(
      confidence: confidence, type: type.toString(), timestamp: DateTime.now());
  await insertMeasuredActivity(measuredActivity);
}

void onPositionData(Position position) async {
  var accuracy = position.accuracy;
  var altitude = position.altitude;
  var heading = position.heading;
  var latitude = position.latitude;
  var longitude = position.longitude;
  var speed = position.speed;
  var speedAccuracy = position.speedAccuracy;

  var measuredLocation = MeasuredLocation(
    accuracy: accuracy,
    altitude: altitude,
    heading: heading,
    latitude: latitude,
    longitude: longitude,
    speed: speed,
    speedAccuracy: speedAccuracy,
    timestamp: DateTime.now(),
  );
  await insertMeasuredLocation(measuredLocation);
}
