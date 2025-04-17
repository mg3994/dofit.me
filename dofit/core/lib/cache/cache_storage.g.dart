// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cache_storage.dart';

// ignore_for_file: type=lint
class $ThemeModeTableTable extends ThemeModeTable
    with TableInfo<$ThemeModeTableTable, ThemeModeTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ThemeModeTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _themeModeIndexMeta = const VerificationMeta(
    'themeModeIndex',
  );
  @override
  late final GeneratedColumn<int> themeModeIndex = GeneratedColumn<int>(
    'theme_mode_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, themeModeIndex];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'theme_mode_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<ThemeModeTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('theme_mode_index')) {
      context.handle(
        _themeModeIndexMeta,
        themeModeIndex.isAcceptableOrUnknown(
          data['theme_mode_index']!,
          _themeModeIndexMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_themeModeIndexMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ThemeModeTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ThemeModeTableData(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      themeModeIndex:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}theme_mode_index'],
          )!,
    );
  }

  @override
  $ThemeModeTableTable createAlias(String alias) {
    return $ThemeModeTableTable(attachedDatabase, alias);
  }
}

class ThemeModeTableData extends DataClass
    implements Insertable<ThemeModeTableData> {
  final int id;
  final int themeModeIndex;
  const ThemeModeTableData({required this.id, required this.themeModeIndex});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['theme_mode_index'] = Variable<int>(themeModeIndex);
    return map;
  }

  ThemeModeTableCompanion toCompanion(bool nullToAbsent) {
    return ThemeModeTableCompanion(
      id: Value(id),
      themeModeIndex: Value(themeModeIndex),
    );
  }

  factory ThemeModeTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ThemeModeTableData(
      id: serializer.fromJson<int>(json['id']),
      themeModeIndex: serializer.fromJson<int>(json['themeModeIndex']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'themeModeIndex': serializer.toJson<int>(themeModeIndex),
    };
  }

  ThemeModeTableData copyWith({int? id, int? themeModeIndex}) =>
      ThemeModeTableData(
        id: id ?? this.id,
        themeModeIndex: themeModeIndex ?? this.themeModeIndex,
      );
  ThemeModeTableData copyWithCompanion(ThemeModeTableCompanion data) {
    return ThemeModeTableData(
      id: data.id.present ? data.id.value : this.id,
      themeModeIndex:
          data.themeModeIndex.present
              ? data.themeModeIndex.value
              : this.themeModeIndex,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ThemeModeTableData(')
          ..write('id: $id, ')
          ..write('themeModeIndex: $themeModeIndex')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, themeModeIndex);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ThemeModeTableData &&
          other.id == this.id &&
          other.themeModeIndex == this.themeModeIndex);
}

class ThemeModeTableCompanion extends UpdateCompanion<ThemeModeTableData> {
  final Value<int> id;
  final Value<int> themeModeIndex;
  const ThemeModeTableCompanion({
    this.id = const Value.absent(),
    this.themeModeIndex = const Value.absent(),
  });
  ThemeModeTableCompanion.insert({
    this.id = const Value.absent(),
    required int themeModeIndex,
  }) : themeModeIndex = Value(themeModeIndex);
  static Insertable<ThemeModeTableData> custom({
    Expression<int>? id,
    Expression<int>? themeModeIndex,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (themeModeIndex != null) 'theme_mode_index': themeModeIndex,
    });
  }

  ThemeModeTableCompanion copyWith({
    Value<int>? id,
    Value<int>? themeModeIndex,
  }) {
    return ThemeModeTableCompanion(
      id: id ?? this.id,
      themeModeIndex: themeModeIndex ?? this.themeModeIndex,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (themeModeIndex.present) {
      map['theme_mode_index'] = Variable<int>(themeModeIndex.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ThemeModeTableCompanion(')
          ..write('id: $id, ')
          ..write('themeModeIndex: $themeModeIndex')
          ..write(')'))
        .toString();
  }
}

abstract class _$CacheStorage extends GeneratedDatabase {
  _$CacheStorage(QueryExecutor e) : super(e);
  $CacheStorageManager get managers => $CacheStorageManager(this);
  late final $ThemeModeTableTable themeModeTable = $ThemeModeTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [themeModeTable];
}

typedef $$ThemeModeTableTableCreateCompanionBuilder =
    ThemeModeTableCompanion Function({
      Value<int> id,
      required int themeModeIndex,
    });
typedef $$ThemeModeTableTableUpdateCompanionBuilder =
    ThemeModeTableCompanion Function({
      Value<int> id,
      Value<int> themeModeIndex,
    });

class $$ThemeModeTableTableFilterComposer
    extends Composer<_$CacheStorage, $ThemeModeTableTable> {
  $$ThemeModeTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get themeModeIndex => $composableBuilder(
    column: $table.themeModeIndex,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ThemeModeTableTableOrderingComposer
    extends Composer<_$CacheStorage, $ThemeModeTableTable> {
  $$ThemeModeTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get themeModeIndex => $composableBuilder(
    column: $table.themeModeIndex,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ThemeModeTableTableAnnotationComposer
    extends Composer<_$CacheStorage, $ThemeModeTableTable> {
  $$ThemeModeTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get themeModeIndex => $composableBuilder(
    column: $table.themeModeIndex,
    builder: (column) => column,
  );
}

class $$ThemeModeTableTableTableManager
    extends
        RootTableManager<
          _$CacheStorage,
          $ThemeModeTableTable,
          ThemeModeTableData,
          $$ThemeModeTableTableFilterComposer,
          $$ThemeModeTableTableOrderingComposer,
          $$ThemeModeTableTableAnnotationComposer,
          $$ThemeModeTableTableCreateCompanionBuilder,
          $$ThemeModeTableTableUpdateCompanionBuilder,
          (
            ThemeModeTableData,
            BaseReferences<
              _$CacheStorage,
              $ThemeModeTableTable,
              ThemeModeTableData
            >,
          ),
          ThemeModeTableData,
          PrefetchHooks Function()
        > {
  $$ThemeModeTableTableTableManager(
    _$CacheStorage db,
    $ThemeModeTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$ThemeModeTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () =>
                  $$ThemeModeTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$ThemeModeTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> themeModeIndex = const Value.absent(),
              }) => ThemeModeTableCompanion(
                id: id,
                themeModeIndex: themeModeIndex,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int themeModeIndex,
              }) => ThemeModeTableCompanion.insert(
                id: id,
                themeModeIndex: themeModeIndex,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ThemeModeTableTableProcessedTableManager =
    ProcessedTableManager<
      _$CacheStorage,
      $ThemeModeTableTable,
      ThemeModeTableData,
      $$ThemeModeTableTableFilterComposer,
      $$ThemeModeTableTableOrderingComposer,
      $$ThemeModeTableTableAnnotationComposer,
      $$ThemeModeTableTableCreateCompanionBuilder,
      $$ThemeModeTableTableUpdateCompanionBuilder,
      (
        ThemeModeTableData,
        BaseReferences<
          _$CacheStorage,
          $ThemeModeTableTable,
          ThemeModeTableData
        >,
      ),
      ThemeModeTableData,
      PrefetchHooks Function()
    >;

class $CacheStorageManager {
  final _$CacheStorage _db;
  $CacheStorageManager(this._db);
  $$ThemeModeTableTableTableManager get themeModeTable =>
      $$ThemeModeTableTableTableManager(_db, _db.themeModeTable);
}
