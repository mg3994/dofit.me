import 'package:core/cache/tables/tables.dart';
import 'package:flutter/foundation.dart';


import 'package:packages/packages.dart';
import 'connection/connection.dart' as impl;
part 'cache_storage.g.dart';

@DriftDatabase(tables: [ThemeModeTable,ThemeFlexSchemeTable,LocaleTable])
class CacheStorage extends _$CacheStorage{
  // After generating code, this class needs to define a `schemaVersion` getter
  // and a constructor telling drift where the database should be stored.
  // These are described in the getting started guide: https://drift.simonbinder.eu/setup/
  CacheStorage([QueryExecutor? executor]) : super(executor ?? driftDatabase(
                name: 'app-cache',
                native: const DriftNativeOptions(
                  shareAcrossIsolates: true,
                  databaseDirectory: getApplicationSupportDirectory,
                ),
                web: DriftWebOptions(
                  sqlite3Wasm: Uri.parse('sqlite3.wasm'),
                  driftWorker: Uri.parse('drift_worker.dart.js'),
                  onResult: (result) {
                    if (result.missingFeatures.isNotEmpty) {
                      debugPrint(
                        'Using ${result.chosenImplementation} due to unsupported '
                        'browser features: ${result.missingFeatures}',
                      );
                    }
                  },
                ),
              ),
  // _openConnection()
  );

  @override
  int get schemaVersion => 1;

  // static QueryExecutor _openConnection() {
  //   return driftDatabase(
  //     name: 'my_database',
  //     native: const DriftNativeOptions(
  //       // By default, `driftDatabase` from `package:drift_flutter` stores the
  //       // database files in `getApplicationDocumentsDirectory()`.
  //       databaseDirectory: getApplicationSupportDirectory,
  //     ),
  //     // If you need web support, see https://drift.simonbinder.eu/platforms/web/
  //   );
  // }
}