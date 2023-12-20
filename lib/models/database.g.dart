// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $CategoriesTable extends Categories
    with TableInfo<$CategoriesTable, Category> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 128),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<int> type = GeneratedColumn<int>(
      'type', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updateAtMeta =
      const VerificationMeta('updateAt');
  @override
  late final GeneratedColumn<DateTime> updateAt = GeneratedColumn<DateTime>(
      'update_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _deleteAtMeta =
      const VerificationMeta('deleteAt');
  @override
  late final GeneratedColumn<DateTime> deleteAt = GeneratedColumn<DateTime>(
      'delete_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, type, createdAt, updateAt, deleteAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'categories';
  @override
  VerificationContext validateIntegrity(Insertable<Category> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('update_at')) {
      context.handle(_updateAtMeta,
          updateAt.isAcceptableOrUnknown(data['update_at']!, _updateAtMeta));
    } else if (isInserting) {
      context.missing(_updateAtMeta);
    }
    if (data.containsKey('delete_at')) {
      context.handle(_deleteAtMeta,
          deleteAt.isAcceptableOrUnknown(data['delete_at']!, _deleteAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Category map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Category(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}type'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updateAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}update_at'])!,
      deleteAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}delete_at']),
    );
  }

  @override
  $CategoriesTable createAlias(String alias) {
    return $CategoriesTable(attachedDatabase, alias);
  }
}

class Category extends DataClass implements Insertable<Category> {
  final int id;
  final String name;
  final int type;
  final DateTime createdAt;
  final DateTime updateAt;
  final DateTime? deleteAt;
  const Category(
      {required this.id,
      required this.name,
      required this.type,
      required this.createdAt,
      required this.updateAt,
      this.deleteAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['type'] = Variable<int>(type);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['update_at'] = Variable<DateTime>(updateAt);
    if (!nullToAbsent || deleteAt != null) {
      map['delete_at'] = Variable<DateTime>(deleteAt);
    }
    return map;
  }

  CategoriesCompanion toCompanion(bool nullToAbsent) {
    return CategoriesCompanion(
      id: Value(id),
      name: Value(name),
      type: Value(type),
      createdAt: Value(createdAt),
      updateAt: Value(updateAt),
      deleteAt: deleteAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deleteAt),
    );
  }

  factory Category.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Category(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      type: serializer.fromJson<int>(json['type']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updateAt: serializer.fromJson<DateTime>(json['updateAt']),
      deleteAt: serializer.fromJson<DateTime?>(json['deleteAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'type': serializer.toJson<int>(type),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updateAt': serializer.toJson<DateTime>(updateAt),
      'deleteAt': serializer.toJson<DateTime?>(deleteAt),
    };
  }

  Category copyWith(
          {int? id,
          String? name,
          int? type,
          DateTime? createdAt,
          DateTime? updateAt,
          Value<DateTime?> deleteAt = const Value.absent()}) =>
      Category(
        id: id ?? this.id,
        name: name ?? this.name,
        type: type ?? this.type,
        createdAt: createdAt ?? this.createdAt,
        updateAt: updateAt ?? this.updateAt,
        deleteAt: deleteAt.present ? deleteAt.value : this.deleteAt,
      );
  @override
  String toString() {
    return (StringBuffer('Category(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('createdAt: $createdAt, ')
          ..write('updateAt: $updateAt, ')
          ..write('deleteAt: $deleteAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, type, createdAt, updateAt, deleteAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Category &&
          other.id == this.id &&
          other.name == this.name &&
          other.type == this.type &&
          other.createdAt == this.createdAt &&
          other.updateAt == this.updateAt &&
          other.deleteAt == this.deleteAt);
}

class CategoriesCompanion extends UpdateCompanion<Category> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> type;
  final Value<DateTime> createdAt;
  final Value<DateTime> updateAt;
  final Value<DateTime?> deleteAt;
  const CategoriesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.type = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updateAt = const Value.absent(),
    this.deleteAt = const Value.absent(),
  });
  CategoriesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int type,
    required DateTime createdAt,
    required DateTime updateAt,
    this.deleteAt = const Value.absent(),
  })  : name = Value(name),
        type = Value(type),
        createdAt = Value(createdAt),
        updateAt = Value(updateAt);
  static Insertable<Category> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? type,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updateAt,
    Expression<DateTime>? deleteAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (type != null) 'type': type,
      if (createdAt != null) 'created_at': createdAt,
      if (updateAt != null) 'update_at': updateAt,
      if (deleteAt != null) 'delete_at': deleteAt,
    });
  }

  CategoriesCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<int>? type,
      Value<DateTime>? createdAt,
      Value<DateTime>? updateAt,
      Value<DateTime?>? deleteAt}) {
    return CategoriesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      createdAt: createdAt ?? this.createdAt,
      updateAt: updateAt ?? this.updateAt,
      deleteAt: deleteAt ?? this.deleteAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (type.present) {
      map['type'] = Variable<int>(type.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updateAt.present) {
      map['update_at'] = Variable<DateTime>(updateAt.value);
    }
    if (deleteAt.present) {
      map['delete_at'] = Variable<DateTime>(deleteAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('createdAt: $createdAt, ')
          ..write('updateAt: $updateAt, ')
          ..write('deleteAt: $deleteAt')
          ..write(')'))
        .toString();
  }
}

class $NotesTable extends Notes with TableInfo<$NotesTable, Note> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NotesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 128),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _categoryidMeta =
      const VerificationMeta('categoryid');
  @override
  late final GeneratedColumn<int> categoryid = GeneratedColumn<int>(
      'categoryid', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _notedateMeta =
      const VerificationMeta('notedate');
  @override
  late final GeneratedColumn<DateTime> notedate = GeneratedColumn<DateTime>(
      'notedate', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _ketMeta = const VerificationMeta('ket');
  @override
  late final GeneratedColumn<String> ket = GeneratedColumn<String>(
      'ket', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 200),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updateAtMeta =
      const VerificationMeta('updateAt');
  @override
  late final GeneratedColumn<DateTime> updateAt = GeneratedColumn<DateTime>(
      'update_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _deleteAtMeta =
      const VerificationMeta('deleteAt');
  @override
  late final GeneratedColumn<DateTime> deleteAt = GeneratedColumn<DateTime>(
      'delete_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, categoryid, notedate, ket, createdAt, updateAt, deleteAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'notes';
  @override
  VerificationContext validateIntegrity(Insertable<Note> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('categoryid')) {
      context.handle(
          _categoryidMeta,
          categoryid.isAcceptableOrUnknown(
              data['categoryid']!, _categoryidMeta));
    } else if (isInserting) {
      context.missing(_categoryidMeta);
    }
    if (data.containsKey('notedate')) {
      context.handle(_notedateMeta,
          notedate.isAcceptableOrUnknown(data['notedate']!, _notedateMeta));
    } else if (isInserting) {
      context.missing(_notedateMeta);
    }
    if (data.containsKey('ket')) {
      context.handle(
          _ketMeta, ket.isAcceptableOrUnknown(data['ket']!, _ketMeta));
    } else if (isInserting) {
      context.missing(_ketMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('update_at')) {
      context.handle(_updateAtMeta,
          updateAt.isAcceptableOrUnknown(data['update_at']!, _updateAtMeta));
    } else if (isInserting) {
      context.missing(_updateAtMeta);
    }
    if (data.containsKey('delete_at')) {
      context.handle(_deleteAtMeta,
          deleteAt.isAcceptableOrUnknown(data['delete_at']!, _deleteAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Note map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Note(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      categoryid: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}categoryid'])!,
      notedate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}notedate'])!,
      ket: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}ket'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updateAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}update_at'])!,
      deleteAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}delete_at']),
    );
  }

  @override
  $NotesTable createAlias(String alias) {
    return $NotesTable(attachedDatabase, alias);
  }
}

class Note extends DataClass implements Insertable<Note> {
  final int id;
  final String name;
  final int categoryid;
  final DateTime notedate;
  final String ket;
  final DateTime createdAt;
  final DateTime updateAt;
  final DateTime? deleteAt;
  const Note(
      {required this.id,
      required this.name,
      required this.categoryid,
      required this.notedate,
      required this.ket,
      required this.createdAt,
      required this.updateAt,
      this.deleteAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['categoryid'] = Variable<int>(categoryid);
    map['notedate'] = Variable<DateTime>(notedate);
    map['ket'] = Variable<String>(ket);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['update_at'] = Variable<DateTime>(updateAt);
    if (!nullToAbsent || deleteAt != null) {
      map['delete_at'] = Variable<DateTime>(deleteAt);
    }
    return map;
  }

  NotesCompanion toCompanion(bool nullToAbsent) {
    return NotesCompanion(
      id: Value(id),
      name: Value(name),
      categoryid: Value(categoryid),
      notedate: Value(notedate),
      ket: Value(ket),
      createdAt: Value(createdAt),
      updateAt: Value(updateAt),
      deleteAt: deleteAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deleteAt),
    );
  }

  factory Note.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Note(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      categoryid: serializer.fromJson<int>(json['categoryid']),
      notedate: serializer.fromJson<DateTime>(json['notedate']),
      ket: serializer.fromJson<String>(json['ket']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updateAt: serializer.fromJson<DateTime>(json['updateAt']),
      deleteAt: serializer.fromJson<DateTime?>(json['deleteAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'categoryid': serializer.toJson<int>(categoryid),
      'notedate': serializer.toJson<DateTime>(notedate),
      'ket': serializer.toJson<String>(ket),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updateAt': serializer.toJson<DateTime>(updateAt),
      'deleteAt': serializer.toJson<DateTime?>(deleteAt),
    };
  }

  Note copyWith(
          {int? id,
          String? name,
          int? categoryid,
          DateTime? notedate,
          String? ket,
          DateTime? createdAt,
          DateTime? updateAt,
          Value<DateTime?> deleteAt = const Value.absent()}) =>
      Note(
        id: id ?? this.id,
        name: name ?? this.name,
        categoryid: categoryid ?? this.categoryid,
        notedate: notedate ?? this.notedate,
        ket: ket ?? this.ket,
        createdAt: createdAt ?? this.createdAt,
        updateAt: updateAt ?? this.updateAt,
        deleteAt: deleteAt.present ? deleteAt.value : this.deleteAt,
      );
  @override
  String toString() {
    return (StringBuffer('Note(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('categoryid: $categoryid, ')
          ..write('notedate: $notedate, ')
          ..write('ket: $ket, ')
          ..write('createdAt: $createdAt, ')
          ..write('updateAt: $updateAt, ')
          ..write('deleteAt: $deleteAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, name, categoryid, notedate, ket, createdAt, updateAt, deleteAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Note &&
          other.id == this.id &&
          other.name == this.name &&
          other.categoryid == this.categoryid &&
          other.notedate == this.notedate &&
          other.ket == this.ket &&
          other.createdAt == this.createdAt &&
          other.updateAt == this.updateAt &&
          other.deleteAt == this.deleteAt);
}

class NotesCompanion extends UpdateCompanion<Note> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> categoryid;
  final Value<DateTime> notedate;
  final Value<String> ket;
  final Value<DateTime> createdAt;
  final Value<DateTime> updateAt;
  final Value<DateTime?> deleteAt;
  const NotesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.categoryid = const Value.absent(),
    this.notedate = const Value.absent(),
    this.ket = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updateAt = const Value.absent(),
    this.deleteAt = const Value.absent(),
  });
  NotesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int categoryid,
    required DateTime notedate,
    required String ket,
    required DateTime createdAt,
    required DateTime updateAt,
    this.deleteAt = const Value.absent(),
  })  : name = Value(name),
        categoryid = Value(categoryid),
        notedate = Value(notedate),
        ket = Value(ket),
        createdAt = Value(createdAt),
        updateAt = Value(updateAt);
  static Insertable<Note> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? categoryid,
    Expression<DateTime>? notedate,
    Expression<String>? ket,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updateAt,
    Expression<DateTime>? deleteAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (categoryid != null) 'categoryid': categoryid,
      if (notedate != null) 'notedate': notedate,
      if (ket != null) 'ket': ket,
      if (createdAt != null) 'created_at': createdAt,
      if (updateAt != null) 'update_at': updateAt,
      if (deleteAt != null) 'delete_at': deleteAt,
    });
  }

  NotesCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<int>? categoryid,
      Value<DateTime>? notedate,
      Value<String>? ket,
      Value<DateTime>? createdAt,
      Value<DateTime>? updateAt,
      Value<DateTime?>? deleteAt}) {
    return NotesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      categoryid: categoryid ?? this.categoryid,
      notedate: notedate ?? this.notedate,
      ket: ket ?? this.ket,
      createdAt: createdAt ?? this.createdAt,
      updateAt: updateAt ?? this.updateAt,
      deleteAt: deleteAt ?? this.deleteAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (categoryid.present) {
      map['categoryid'] = Variable<int>(categoryid.value);
    }
    if (notedate.present) {
      map['notedate'] = Variable<DateTime>(notedate.value);
    }
    if (ket.present) {
      map['ket'] = Variable<String>(ket.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updateAt.present) {
      map['update_at'] = Variable<DateTime>(updateAt.value);
    }
    if (deleteAt.present) {
      map['delete_at'] = Variable<DateTime>(deleteAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NotesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('categoryid: $categoryid, ')
          ..write('notedate: $notedate, ')
          ..write('ket: $ket, ')
          ..write('createdAt: $createdAt, ')
          ..write('updateAt: $updateAt, ')
          ..write('deleteAt: $deleteAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(e);
  late final $CategoriesTable categories = $CategoriesTable(this);
  late final $NotesTable notes = $NotesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [categories, notes];
}
