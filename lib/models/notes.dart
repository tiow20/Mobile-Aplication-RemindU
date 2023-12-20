import 'package:drift/drift.dart';



class Notes extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name =>text().withLength(max: 128)();
  IntColumn get categoryid => integer()();
  DateTimeColumn get notedate => dateTime()();
  TextColumn get ket =>text().withLength(max: 200)();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updateAt => dateTime()();
  DateTimeColumn get deleteAt => dateTime().nullable()();


} 