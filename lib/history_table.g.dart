// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_table.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class HistoryTableData extends DataClass
    implements Insertable<HistoryTableData> {
  final String id;
  final DateTime seldateTime;
  HistoryTableData({@required this.id, @required this.seldateTime});
  factory HistoryTableData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return HistoryTableData(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      seldateTime: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}seldate_time']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<String>(id);
    }
    if (!nullToAbsent || seldateTime != null) {
      map['seldate_time'] = Variable<DateTime>(seldateTime);
    }
    return map;
  }

  HistoryTableCompanion toCompanion(bool nullToAbsent) {
    return HistoryTableCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      seldateTime: seldateTime == null && nullToAbsent
          ? const Value.absent()
          : Value(seldateTime),
    );
  }

  factory HistoryTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return HistoryTableData(
      id: serializer.fromJson<String>(json['id']),
      seldateTime: serializer.fromJson<DateTime>(json['seldateTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'seldateTime': serializer.toJson<DateTime>(seldateTime),
    };
  }

  HistoryTableData copyWith({String id, DateTime seldateTime}) =>
      HistoryTableData(
        id: id ?? this.id,
        seldateTime: seldateTime ?? this.seldateTime,
      );
  @override
  String toString() {
    return (StringBuffer('HistoryTableData(')
          ..write('id: $id, ')
          ..write('seldateTime: $seldateTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, seldateTime.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is HistoryTableData &&
          other.id == this.id &&
          other.seldateTime == this.seldateTime);
}

class HistoryTableCompanion extends UpdateCompanion<HistoryTableData> {
  final Value<String> id;
  final Value<DateTime> seldateTime;
  const HistoryTableCompanion({
    this.id = const Value.absent(),
    this.seldateTime = const Value.absent(),
  });
  HistoryTableCompanion.insert({
    @required String id,
    @required DateTime seldateTime,
  })  : id = Value(id),
        seldateTime = Value(seldateTime);
  static Insertable<HistoryTableData> custom({
    Expression<String> id,
    Expression<DateTime> seldateTime,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (seldateTime != null) 'seldate_time': seldateTime,
    });
  }

  HistoryTableCompanion copyWith(
      {Value<String> id, Value<DateTime> seldateTime}) {
    return HistoryTableCompanion(
      id: id ?? this.id,
      seldateTime: seldateTime ?? this.seldateTime,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (seldateTime.present) {
      map['seldate_time'] = Variable<DateTime>(seldateTime.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HistoryTableCompanion(')
          ..write('id: $id, ')
          ..write('seldateTime: $seldateTime')
          ..write(')'))
        .toString();
  }
}

class $HistoryTableTable extends HistoryTable
    with TableInfo<$HistoryTableTable, HistoryTableData> {
  final GeneratedDatabase _db;
  final String _alias;
  $HistoryTableTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  @override
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _seldateTimeMeta =
      const VerificationMeta('seldateTime');
  GeneratedDateTimeColumn _seldateTime;
  @override
  GeneratedDateTimeColumn get seldateTime =>
      _seldateTime ??= _constructSeldateTime();
  GeneratedDateTimeColumn _constructSeldateTime() {
    return GeneratedDateTimeColumn(
      'seldate_time',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, seldateTime];
  @override
  $HistoryTableTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'history_table';
  @override
  final String actualTableName = 'history_table';
  @override
  VerificationContext validateIntegrity(Insertable<HistoryTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('seldate_time')) {
      context.handle(
          _seldateTimeMeta,
          seldateTime.isAcceptableOrUnknown(
              data['seldate_time'], _seldateTimeMeta));
    } else if (isInserting) {
      context.missing(_seldateTimeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  HistoryTableData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return HistoryTableData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $HistoryTableTable createAlias(String alias) {
    return $HistoryTableTable(_db, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $HistoryTableTable _historyTable;
  $HistoryTableTable get historyTable =>
      _historyTable ??= $HistoryTableTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [historyTable];
}
