import 'dart:async';
import 'package:activity_recognition_flutter/activity_recognition_flutter.dart';
import 'dart:developer';
import 'package:geolocator/geolocator.dart';

Stream<Activity> stream;

StreamSubscription<Position> positionStream;

void startActivityMonitor() {
  // Start the stream updates
  stream = ActivityRecognition.activityUpdates();
  stream.listen(onData);
  // log("Hello world");
  positionStream =
  getPositionStream(desiredAccuracy: LocationAccuracy.high).listen((Position position) {
  print(position == null
      ? 'Unknown'
      : position.latitude.toString() + ', ' + position.longitude.toString());
});
}

void onData(Activity activity) {
  // Do something with the activity
  var type = activity.type;
  var confidence = activity.confidence;

  log(type.toString() + " " + confidence.toString());
}
