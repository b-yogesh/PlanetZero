import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<void> initDatabase() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Open the database and store the reference.
  final Future<Database> database = openDatabase(
    join(await getDatabasesPath(), 'database.db'),
    onCreate: (db, version) {
      return db.execute(
        """
        CREATE TABLE activities(
          id INTEGER PRIMARY KEY, 
          name TEXT, 
          age INTEGER
        );
        """,
      );
    },
    version: 1,
  );
}
