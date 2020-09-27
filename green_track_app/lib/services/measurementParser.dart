import 'dart:math';

import 'package:green_track_app/models/MeasuredActivity.dart';
import 'package:green_track_app/models/MeasuredLocation.dart';
import 'package:green_track_app/models/ParsedActivity.dart';
import 'package:green_track_app/services/database.dart';

// 1. detect "sessions" of activies (DONE)
// 2. in case of vehicle, send location to be analyzed by the AI
// 3. add a ParsedActivity in the databse (DONE)

void parseMeasurements() async {
  while (await parseNextMeasurementSession()) {}
}

Future<bool> parseNextMeasurementSession() async {
  var activities = await measuredActivities();
  if (activities.length == 0) return false;

  String type;
  DateTime timestamp;
  List<MeasuredActivity> matchingActivities = [];
  for (var activity in activities) {
    if (activity.type == type || type == null) {
      matchingActivities.add(activity);
    } else if (DateTime.now().difference(timestamp).inMinutes >= 5) {
      break;
    }
  }

  var start = matchingActivities.first.timestamp;
  var end = matchingActivities.last.timestamp;
  var distance = await getDistanceTravelled(start, end);

  var parsedActivity = ParsedActivity(
    type: type,
    start: start,
    end: end,
    distance: distance,
  );
  
  await insertParsedActivity(parsedActivity);
  await markMeasuredActivitiesAsParsed(start, end);
  return true;
}

Future<double> getDistanceTravelled(DateTime from, DateTime to) async {
  var dataPoints = await measuredLocationsInRange(from, to);
  MeasuredLocation lastPoint;
  var sum = 0.0;
  for (var p in dataPoints) {
    if (lastPoint != null) {
      var distance = calculateDistance(
        lastPoint.latitude,
        lastPoint.longitude,
        p.latitude,
        p.longitude,
      );
      sum += distance;
    }
    lastPoint = p;
  }
  return sum;
}

double calculateDistance(lat1, lon1, lat2, lon2) {
  var p = 0.017453292519943295;
  var c = cos;
  var a = 0.5 -
      c((lat2 - lat1) * p) / 2 +
      c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
  return 12742 * asin(sqrt(a));
}
