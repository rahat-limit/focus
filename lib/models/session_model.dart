import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class Session {
  final String id;
  final int time;
  final List<String> category;
  final DateTime date;
  Session(
      {String? id,
      required this.time,
      required this.category,
      required this.date})
      : id = id ?? uuid.v4();
}
