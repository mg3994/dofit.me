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

class $ThemeFlexSchemeTableTable extends ThemeFlexSchemeTable
    with TableInfo<$ThemeFlexSchemeTableTable, ThemeFlexSchemeTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ThemeFlexSchemeTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _flexSchemeIndexMeta = const VerificationMeta(
    'flexSchemeIndex',
  );
  @override
  late final GeneratedColumn<int> flexSchemeIndex = GeneratedColumn<int>(
    'flex_scheme_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, flexSchemeIndex];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'theme_flex_scheme_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<ThemeFlexSchemeTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('flex_scheme_index')) {
      context.handle(
        _flexSchemeIndexMeta,
        flexSchemeIndex.isAcceptableOrUnknown(
          data['flex_scheme_index']!,
          _flexSchemeIndexMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_flexSchemeIndexMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ThemeFlexSchemeTableData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ThemeFlexSchemeTableData(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      flexSchemeIndex:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}flex_scheme_index'],
          )!,
    );
  }

  @override
  $ThemeFlexSchemeTableTable createAlias(String alias) {
    return $ThemeFlexSchemeTableTable(attachedDatabase, alias);
  }
}

class ThemeFlexSchemeTableData extends DataClass
    implements Insertable<ThemeFlexSchemeTableData> {
  final int id;
  final int flexSchemeIndex;
  const ThemeFlexSchemeTableData({
    required this.id,
    required this.flexSchemeIndex,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['flex_scheme_index'] = Variable<int>(flexSchemeIndex);
    return map;
  }

  ThemeFlexSchemeTableCompanion toCompanion(bool nullToAbsent) {
    return ThemeFlexSchemeTableCompanion(
      id: Value(id),
      flexSchemeIndex: Value(flexSchemeIndex),
    );
  }

  factory ThemeFlexSchemeTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ThemeFlexSchemeTableData(
      id: serializer.fromJson<int>(json['id']),
      flexSchemeIndex: serializer.fromJson<int>(json['flexSchemeIndex']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'flexSchemeIndex': serializer.toJson<int>(flexSchemeIndex),
    };
  }

  ThemeFlexSchemeTableData copyWith({int? id, int? flexSchemeIndex}) =>
      ThemeFlexSchemeTableData(
        id: id ?? this.id,
        flexSchemeIndex: flexSchemeIndex ?? this.flexSchemeIndex,
      );
  ThemeFlexSchemeTableData copyWithCompanion(
    ThemeFlexSchemeTableCompanion data,
  ) {
    return ThemeFlexSchemeTableData(
      id: data.id.present ? data.id.value : this.id,
      flexSchemeIndex:
          data.flexSchemeIndex.present
              ? data.flexSchemeIndex.value
              : this.flexSchemeIndex,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ThemeFlexSchemeTableData(')
          ..write('id: $id, ')
          ..write('flexSchemeIndex: $flexSchemeIndex')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, flexSchemeIndex);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ThemeFlexSchemeTableData &&
          other.id == this.id &&
          other.flexSchemeIndex == this.flexSchemeIndex);
}

class ThemeFlexSchemeTableCompanion
    extends UpdateCompanion<ThemeFlexSchemeTableData> {
  final Value<int> id;
  final Value<int> flexSchemeIndex;
  const ThemeFlexSchemeTableCompanion({
    this.id = const Value.absent(),
    this.flexSchemeIndex = const Value.absent(),
  });
  ThemeFlexSchemeTableCompanion.insert({
    this.id = const Value.absent(),
    required int flexSchemeIndex,
  }) : flexSchemeIndex = Value(flexSchemeIndex);
  static Insertable<ThemeFlexSchemeTableData> custom({
    Expression<int>? id,
    Expression<int>? flexSchemeIndex,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (flexSchemeIndex != null) 'flex_scheme_index': flexSchemeIndex,
    });
  }

  ThemeFlexSchemeTableCompanion copyWith({
    Value<int>? id,
    Value<int>? flexSchemeIndex,
  }) {
    return ThemeFlexSchemeTableCompanion(
      id: id ?? this.id,
      flexSchemeIndex: flexSchemeIndex ?? this.flexSchemeIndex,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (flexSchemeIndex.present) {
      map['flex_scheme_index'] = Variable<int>(flexSchemeIndex.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ThemeFlexSchemeTableCompanion(')
          ..write('id: $id, ')
          ..write('flexSchemeIndex: $flexSchemeIndex')
          ..write(')'))
        .toString();
  }
}

class $LocaleTableTable extends LocaleTable
    with TableInfo<$LocaleTableTable, LocaleTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocaleTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _languageCodeMeta = const VerificationMeta(
    'languageCode',
  );
  @override
  late final GeneratedColumn<String> languageCode = GeneratedColumn<String>(
    'language_code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, languageCode];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'locale_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<LocaleTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('language_code')) {
      context.handle(
        _languageCodeMeta,
        languageCode.isAcceptableOrUnknown(
          data['language_code']!,
          _languageCodeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_languageCodeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LocaleTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocaleTableData(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      languageCode:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}language_code'],
          )!,
    );
  }

  @override
  $LocaleTableTable createAlias(String alias) {
    return $LocaleTableTable(attachedDatabase, alias);
  }
}

class LocaleTableData extends DataClass implements Insertable<LocaleTableData> {
  final int id;
  final String languageCode;
  const LocaleTableData({required this.id, required this.languageCode});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['language_code'] = Variable<String>(languageCode);
    return map;
  }

  LocaleTableCompanion toCompanion(bool nullToAbsent) {
    return LocaleTableCompanion(
      id: Value(id),
      languageCode: Value(languageCode),
    );
  }

  factory LocaleTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocaleTableData(
      id: serializer.fromJson<int>(json['id']),
      languageCode: serializer.fromJson<String>(json['languageCode']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'languageCode': serializer.toJson<String>(languageCode),
    };
  }

  LocaleTableData copyWith({int? id, String? languageCode}) => LocaleTableData(
    id: id ?? this.id,
    languageCode: languageCode ?? this.languageCode,
  );
  LocaleTableData copyWithCompanion(LocaleTableCompanion data) {
    return LocaleTableData(
      id: data.id.present ? data.id.value : this.id,
      languageCode:
          data.languageCode.present
              ? data.languageCode.value
              : this.languageCode,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocaleTableData(')
          ..write('id: $id, ')
          ..write('languageCode: $languageCode')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, languageCode);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocaleTableData &&
          other.id == this.id &&
          other.languageCode == this.languageCode);
}

class LocaleTableCompanion extends UpdateCompanion<LocaleTableData> {
  final Value<int> id;
  final Value<String> languageCode;
  const LocaleTableCompanion({
    this.id = const Value.absent(),
    this.languageCode = const Value.absent(),
  });
  LocaleTableCompanion.insert({
    this.id = const Value.absent(),
    required String languageCode,
  }) : languageCode = Value(languageCode);
  static Insertable<LocaleTableData> custom({
    Expression<int>? id,
    Expression<String>? languageCode,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (languageCode != null) 'language_code': languageCode,
    });
  }

  LocaleTableCompanion copyWith({Value<int>? id, Value<String>? languageCode}) {
    return LocaleTableCompanion(
      id: id ?? this.id,
      languageCode: languageCode ?? this.languageCode,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (languageCode.present) {
      map['language_code'] = Variable<String>(languageCode.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocaleTableCompanion(')
          ..write('id: $id, ')
          ..write('languageCode: $languageCode')
          ..write(')'))
        .toString();
  }
}

abstract class _$CacheStorage extends GeneratedDatabase {
  _$CacheStorage(QueryExecutor e) : super(e);
  $CacheStorageManager get managers => $CacheStorageManager(this);
  late final $ThemeModeTableTable themeModeTable = $ThemeModeTableTable(this);
  late final $ThemeFlexSchemeTableTable themeFlexSchemeTable =
      $ThemeFlexSchemeTableTable(this);
  late final $LocaleTableTable localeTable = $LocaleTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    themeModeTable,
    themeFlexSchemeTable,
    localeTable,
  ];
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
typedef $$ThemeFlexSchemeTableTableCreateCompanionBuilder =
    ThemeFlexSchemeTableCompanion Function({
      Value<int> id,
      required int flexSchemeIndex,
    });
typedef $$ThemeFlexSchemeTableTableUpdateCompanionBuilder =
    ThemeFlexSchemeTableCompanion Function({
      Value<int> id,
      Value<int> flexSchemeIndex,
    });

class $$ThemeFlexSchemeTableTableFilterComposer
    extends Composer<_$CacheStorage, $ThemeFlexSchemeTableTable> {
  $$ThemeFlexSchemeTableTableFilterComposer({
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

  ColumnFilters<int> get flexSchemeIndex => $composableBuilder(
    column: $table.flexSchemeIndex,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ThemeFlexSchemeTableTableOrderingComposer
    extends Composer<_$CacheStorage, $ThemeFlexSchemeTableTable> {
  $$ThemeFlexSchemeTableTableOrderingComposer({
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

  ColumnOrderings<int> get flexSchemeIndex => $composableBuilder(
    column: $table.flexSchemeIndex,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ThemeFlexSchemeTableTableAnnotationComposer
    extends Composer<_$CacheStorage, $ThemeFlexSchemeTableTable> {
  $$ThemeFlexSchemeTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get flexSchemeIndex => $composableBuilder(
    column: $table.flexSchemeIndex,
    builder: (column) => column,
  );
}

class $$ThemeFlexSchemeTableTableTableManager
    extends
        RootTableManager<
          _$CacheStorage,
          $ThemeFlexSchemeTableTable,
          ThemeFlexSchemeTableData,
          $$ThemeFlexSchemeTableTableFilterComposer,
          $$ThemeFlexSchemeTableTableOrderingComposer,
          $$ThemeFlexSchemeTableTableAnnotationComposer,
          $$ThemeFlexSchemeTableTableCreateCompanionBuilder,
          $$ThemeFlexSchemeTableTableUpdateCompanionBuilder,
          (
            ThemeFlexSchemeTableData,
            BaseReferences<
              _$CacheStorage,
              $ThemeFlexSchemeTableTable,
              ThemeFlexSchemeTableData
            >,
          ),
          ThemeFlexSchemeTableData,
          PrefetchHooks Function()
        > {
  $$ThemeFlexSchemeTableTableTableManager(
    _$CacheStorage db,
    $ThemeFlexSchemeTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$ThemeFlexSchemeTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer:
              () => $$ThemeFlexSchemeTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$ThemeFlexSchemeTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> flexSchemeIndex = const Value.absent(),
              }) => ThemeFlexSchemeTableCompanion(
                id: id,
                flexSchemeIndex: flexSchemeIndex,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int flexSchemeIndex,
              }) => ThemeFlexSchemeTableCompanion.insert(
                id: id,
                flexSchemeIndex: flexSchemeIndex,
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

typedef $$ThemeFlexSchemeTableTableProcessedTableManager =
    ProcessedTableManager<
      _$CacheStorage,
      $ThemeFlexSchemeTableTable,
      ThemeFlexSchemeTableData,
      $$ThemeFlexSchemeTableTableFilterComposer,
      $$ThemeFlexSchemeTableTableOrderingComposer,
      $$ThemeFlexSchemeTableTableAnnotationComposer,
      $$ThemeFlexSchemeTableTableCreateCompanionBuilder,
      $$ThemeFlexSchemeTableTableUpdateCompanionBuilder,
      (
        ThemeFlexSchemeTableData,
        BaseReferences<
          _$CacheStorage,
          $ThemeFlexSchemeTableTable,
          ThemeFlexSchemeTableData
        >,
      ),
      ThemeFlexSchemeTableData,
      PrefetchHooks Function()
    >;
typedef $$LocaleTableTableCreateCompanionBuilder =
    LocaleTableCompanion Function({
      Value<int> id,
      required String languageCode,
    });
typedef $$LocaleTableTableUpdateCompanionBuilder =
    LocaleTableCompanion Function({Value<int> id, Value<String> languageCode});

class $$LocaleTableTableFilterComposer
    extends Composer<_$CacheStorage, $LocaleTableTable> {
  $$LocaleTableTableFilterComposer({
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

  ColumnFilters<String> get languageCode => $composableBuilder(
    column: $table.languageCode,
    builder: (column) => ColumnFilters(column),
  );
}

class $$LocaleTableTableOrderingComposer
    extends Composer<_$CacheStorage, $LocaleTableTable> {
  $$LocaleTableTableOrderingComposer({
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

  ColumnOrderings<String> get languageCode => $composableBuilder(
    column: $table.languageCode,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LocaleTableTableAnnotationComposer
    extends Composer<_$CacheStorage, $LocaleTableTable> {
  $$LocaleTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get languageCode => $composableBuilder(
    column: $table.languageCode,
    builder: (column) => column,
  );
}

class $$LocaleTableTableTableManager
    extends
        RootTableManager<
          _$CacheStorage,
          $LocaleTableTable,
          LocaleTableData,
          $$LocaleTableTableFilterComposer,
          $$LocaleTableTableOrderingComposer,
          $$LocaleTableTableAnnotationComposer,
          $$LocaleTableTableCreateCompanionBuilder,
          $$LocaleTableTableUpdateCompanionBuilder,
          (
            LocaleTableData,
            BaseReferences<_$CacheStorage, $LocaleTableTable, LocaleTableData>,
          ),
          LocaleTableData,
          PrefetchHooks Function()
        > {
  $$LocaleTableTableTableManager(_$CacheStorage db, $LocaleTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$LocaleTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$LocaleTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () =>
                  $$LocaleTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> languageCode = const Value.absent(),
              }) => LocaleTableCompanion(id: id, languageCode: languageCode),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String languageCode,
              }) => LocaleTableCompanion.insert(
                id: id,
                languageCode: languageCode,
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

typedef $$LocaleTableTableProcessedTableManager =
    ProcessedTableManager<
      _$CacheStorage,
      $LocaleTableTable,
      LocaleTableData,
      $$LocaleTableTableFilterComposer,
      $$LocaleTableTableOrderingComposer,
      $$LocaleTableTableAnnotationComposer,
      $$LocaleTableTableCreateCompanionBuilder,
      $$LocaleTableTableUpdateCompanionBuilder,
      (
        LocaleTableData,
        BaseReferences<_$CacheStorage, $LocaleTableTable, LocaleTableData>,
      ),
      LocaleTableData,
      PrefetchHooks Function()
    >;

class $CacheStorageManager {
  final _$CacheStorage _db;
  $CacheStorageManager(this._db);
  $$ThemeModeTableTableTableManager get themeModeTable =>
      $$ThemeModeTableTableTableManager(_db, _db.themeModeTable);
  $$ThemeFlexSchemeTableTableTableManager get themeFlexSchemeTable =>
      $$ThemeFlexSchemeTableTableTableManager(_db, _db.themeFlexSchemeTable);
  $$LocaleTableTableTableManager get localeTable =>
      $$LocaleTableTableTableManager(_db, _db.localeTable);
}
