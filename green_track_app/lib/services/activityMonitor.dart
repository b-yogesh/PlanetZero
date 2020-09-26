import 'package:activity_recognition_flutter/activity_recognition_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'dart:developer';
import 'package:geolocator/geolocator.dart';

void startActivityMonitor() {
  WidgetsFlutterBinding.ensureInitialized();

  // Start the activity stream updates
  ActivityRecognition.activityUpdates().listen(onActivityData);

  // Start the position stream updates
  getPositionStream(desiredAccuracy: LocationAccuracy.high).listen(onPositionData);
}

void onActivityData(Activity activity) {
  // Do something with the activity
  var type = activity.type;
  var confidence = activity.confidence;

  log(type.toString() + " " + confidence.toString());
}

void onPositionData(Position position) {
  print(position == null
      ? 'Unknown'
      : position.latitude.toString() + ', ' + position.longitude.toString());
}