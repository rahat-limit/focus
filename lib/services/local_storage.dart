import 'package:focus/models/session_model.dart';
import 'package:sqflite/sqflite.dart' as sql;
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as path;

class LocalStorage {
  Future<sql.Database> init() async {
    final dbPath = await sql.getDatabasesPath();
    final db = await sql.openDatabase(path.join(dbPath, 'session.db'),
        onCreate: (db, version) async {
      await db.execute(
          'CREATE TABLE session(id TEXT PRIMARY KEY, time INTEGER, categories TEXT, date TEXT)');
    }, version: 2);
    return db;
  }

  String fromListToString(List<String> list) {
    String data = '';
    String sep = ',';
    for (int i = 0; i < list.length; i++) {
      data = list[i] + sep + data;
    }
    return data;
  }

  // ignore: non_constant_identifier_names
  List<String> FromStringToList(String data) {
    List<String> items = [];
    data.split(',').forEach((element) {
      items.add(element);
    });
    return items;
  }

  Future newSession({required Session session}) async {
    try {
      final db = await init();
      await db.insert('session', {
        'id': session.id,
        'time': session.time,
        'categories': session.category.isEmpty
            ? 'study'
            : fromListToString(session.category),
        'date': session.date.toString()
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Session>> getSessions() async {
    try {
      final db = await init();
      final data = await db.query('session');
      List<Session> items;
      if (data.isNotEmpty) {
        items = data.map((e) {
          return Session(
              time: e['time'] as int,
              category: FromStringToList(e['categories'] as String),
              date: DateTime.parse(e['date'] as String));
        }).toList();
      } else {
        items = [];
      }
      return items;
    } catch (e) {
      rethrow;
    }
  }

  Future deleteAll() async {
    try {
      final db = await init();
      await db.delete('session');
    } catch (e) {
      rethrow;
    }
  }
}
