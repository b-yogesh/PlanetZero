import 'package:green_track_app/models/MeasuredActivity.dart';
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

  var parsedActivity =
      ParsedActivity(type: type, start: start, end: end, distance: 0);
  await insertParsedActivity(parsedActivity);
  await markMeasuredActivitiesAsParsed(start, end);
  return true;
}
