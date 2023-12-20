import 'dart:io';

import 'package:drift/drift.dart';
// These imports are used to open the database
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:uas/models/categories.dart';
import 'package:uas/models/notes.dart';
import 'package:uas/models/notes_with_categories.dart';

part 'database.g.dart';

@DriftDatabase(
  // relative import for the drift file. Drift also supports `package:`
  // imports
  tables : [Categories, Notes]
)
class AppDb extends _$AppDb {
  AppDb() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  //CRUD category
  Future<List<Category>> getAllCategoryRepo(int type) async{
    return await (select(categories)..where((tbl) => tbl.type.equals(type))).get();
  }
  Future updateCategoryRepo(int id, String name) async{
    return (update(categories)..where((tbl) => tbl.id.equals(id)))
    .write(CategoriesCompanion(name : Value(name)));
  }
  Future deleteCategoryRepo( int id) async {
    return (delete(categories)..where((tbl) => tbl.id.equals(id)))
    .go();
  }

  //notes
  
  Stream<List<NotesWithCategory>> getNotesByDateRepo(DateTime date) {
    final query = (select(notes).join([
      innerJoin(categories,categories.id.equalsExp(notes.categoryid))
    ])..where(notes.notedate.equals(date)));

    return query.watch().map((rows){
      return rows.map((row){
        return NotesWithCategory(
          row.readTable(notes as ResultSetImplementation<$NotesTable, Notes>), row.readTable(categories as ResultSetImplementation<$CategoriesTable, Categories>));
      }).toList();
   } );
  }
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    return NativeDatabase.createInBackground(file);
  });
}
