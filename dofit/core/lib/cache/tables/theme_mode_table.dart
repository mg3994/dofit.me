import 'package:drift/drift.dart';

class ThemeModeTable extends Table {
  IntColumn get id => integer().autoIncrement()(); // only 1 row ever
  IntColumn get themeModeIndex => integer()(); // stores ThemeMode index
}