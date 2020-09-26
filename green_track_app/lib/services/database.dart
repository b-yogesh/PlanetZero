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
    onCreate: (db, version) {
      return db.execute(
        """
        CREATE TABLE measuredActivities (
          id INTEGER PRIMARY KEY, 
          type TEXT,
          confidence INTEGER,
          timestamp TEXT
        );

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

        CREATE TABLE parsedActivities (
          id INTEGER PRIMARY KEY, 
          type TEXT,
          start TEXT,
          end TEXT,
          distance REAL
        );
        """,
      );
    },
    version: 2,
  );
  // wait for the db onCreate to run - idk why this fixes the bug
  await db.getVersion();
}

Future<void> insertMeasuredActivity(MeasuredActivity measuredActivity) async {
  await db.insert('measuredActivities', measuredActivity.toMap());
}

Future<void> insertMeasuredLocation(MeasuredLocation measuredLocation) async {
  await db.insert('measuredLocations', measuredLocation.toMap());
}

Future<void> insertActivity(ParsedActivity activity) async {
  await db.insert('parsedActivities', activity.toMap());
}
