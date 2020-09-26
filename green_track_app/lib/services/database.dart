import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> database;

Future<void> initDatabase() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Open the database and store the reference.
  database = openDatabase(
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
          timestamp TEXT
        );

        CREATE TABLE activities (
          id INTEGER PRIMARY KEY, 
          type TEXT,
          start TEXT,
          end TEXT,
          distance TEXT
        );
        """,
      );
    },
    version: 1,
  );
}
