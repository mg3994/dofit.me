import 'package:drift/drift.dart';

class ThemeFlexSchemeTable extends Table {
  IntColumn get id => integer().autoIncrement()(); // only 1 row ever
  IntColumn get flexSchemeIndex => integer()(); // stores ThemeMode index
}