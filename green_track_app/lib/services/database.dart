import 'package:flutter/material.dart';
import 'package:green_track_app/models/MeasuredActivity.dart';
import 'package:green_track_app/models/MeasuredLocation.dart';
import 'package:green_track_app/models/ParsedActivity.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Database db;

Future<void> initDatabase() async {
  WidgetsFlutterBinding.ensureInitialized();
  db = await openDatabase(
    join(await getDatabasesPath(), 'database.db'),
    onCreate: (db, version) async {
      await db.execute(MeasuredActivity.dropSQL());
      await db.execute(MeasuredActivity.createSQL());
      
      await db.execute(MeasuredLocation.dropSQL());
      await db.execute(MeasuredLocation.createSQL());

      await db.execute(ParsedActivity.dropSQL());
      await db.execute(ParsedActivity.createSQL());
    },
    version: 6,
  );
}

Future<void> insertMeasuredActivity(MeasuredActivity measuredActivity) async {
  await db.insert('measuredActivities', measuredActivity.toMap());
}

Future<void> insertMeasuredLocation(MeasuredLocation measuredLocation) async {
  await db.insert('measuredLocations', measuredLocation.toMap());
}

Future<void> insertParsedActivity(ParsedActivity activity) async {
  await db.insert('parsedActivities', activity.toMap());
}

Future<List<ParsedActivity>> parsedActivities() async {
  final List<Map<String, dynamic>> maps = await db.query('parsedActivities');
  return List.generate(maps.length, (i) {
    return ParsedActivity.fromMap(maps[i]);
  });
}

Future<List<ParsedActivity>> measuredLocationsInRange(DateTime from, DateTime to) async {
  final List<Map<String, dynamic>> maps = await db.query(
    'measuredLocations',
    where: 'from >= ? AND to <= ?',
    whereArgs: [],
  );

  return List.generate(maps.length, (i) {
    return ParsedActivity.fromMap(maps[i]);
  });
}

Future<List<ParsedActivity>> measuredActivities(DateTime from, DateTime to) async {
  final List<Map<String, dynamic>> maps = await db.query(
    'measuredActivities'
  );

  return List.generate(maps.length, (i) {
    return ParsedActivity.fromMap(maps[i]);
  });
}
