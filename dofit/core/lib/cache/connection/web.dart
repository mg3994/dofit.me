// import 'dart:async';

// import 'package:drift/drift.dart';
// import 'package:drift/wasm.dart';
// import 'package:http/http.dart' as http;
// import 'package:sqlite3/wasm.dart';

// DatabaseConnection connect(
//   String dbName, {
//   bool logStatements = false,
//   bool inMemory = false,
// }) {
//   return DatabaseConnection.delayed(Future.sync(() async {
//     final response = await http.get(Uri.parse('sqlite3.wasm'));
//     final fs = await IndexedDbFileSystem.open(dbName: '/db/');
//     final sqlite3 = await WasmSqlite3.load(
//       response.bodyBytes,
//       // SqliteEnvironment(fileSystem: fs),
//     );
//     if (inMemory) {
//       return DatabaseConnection(WasmDatabase.inMemory(
//         sqlite3,
//         logStatements: logStatements,
//       ));
//     } else {
//       final path = '/drift/db/$dbName';
//       return DatabaseConnection(WasmDatabase(
//         sqlite3: sqlite3,
//         path: path,
//         fileSystem: fs,
//         logStatements: logStatements,
//       ));
//     }
//   }));
// }
import 'package:drift/drift.dart';
import 'package:drift_dev/api/migrations_web.dart';
import 'package:flutter/foundation.dart';
import 'package:sqlite3/wasm.dart';

Future<void> validateDatabaseSchema(GeneratedDatabase database) async {
  // This method validates that the actual schema of the opened database matches
  // the tables, views, triggers and indices for which drift_dev has generated
  // code.
  // Validating the database's schema after opening it is generally a good idea,
  // since it allows us to get an early warning if we change a table definition
  // without writing a schema migration for it.
  //
  // For details, see: https://drift.simonbinder.eu/docs/advanced-features/migrations/#verifying-a-database-schema-at-runtime
  if (kDebugMode) {
    final sqlite = await WasmSqlite3.loadFromUrl(Uri.parse('/sqlite3.wasm'));
    sqlite.registerVirtualFileSystem(InMemoryFileSystem(), makeDefault: true);

    await VerifySelf(database).validateDatabaseSchema(sqlite3: sqlite);
  }
}