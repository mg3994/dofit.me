import 'package:drift/drift.dart';

class LocaleTable extends Table {
  IntColumn get id => integer().autoIncrement()(); // only 1 row ever
  TextColumn get languageCode => text()(); 
}