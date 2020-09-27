import 'package:green_track_app/models/ParsedActivity.dart';

void getCurrentEmissions() {}

double getEmissionForActivity(ParsedActivity parsedActivity) {
  double amountPerKm;
  switch (parsedActivity.type) {
    case "Automotive":
    case "IN_VEHICLE":
      amountPerKm = 0.28;
      break;

    default:
      return 0;
  }
  return amountPerKm * parsedActivity.distance;
}
