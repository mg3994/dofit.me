import 'package:core/core.dart';
import 'package:flutter/material.dart';

import 'package:l10nr/data/sources/l10nr_data_source.dart';
import 'package:l10nr/domain/entities/l10nr_entity.dart';

class L10nrLocalDataSource implements L10nrDataSource {
    final CacheStorage cacheStorage; // TODO: change to SharePreff or other as that gives bool

  const L10nrLocalDataSource({required this.cacheStorage});

  @override
  Future<L10nrEntity> getLocale()async {
   final record = await cacheStorage.select(cacheStorage.localeTable).getSingleOrNull();
   if (record == null) {
    return L10nrEntity(locale: Locale.fromSubtags(languageCode: 'en') );
   }
  return L10nrEntity(locale: Locale.fromSubtags(languageCode: record.languageCode));
  }

  @override
  Future<bool> setLocale(L10nrEntity l10nrEntity) async{
     // Delete old (only one record needed)
    await cacheStorage.delete(cacheStorage.localeTable).go();
    final rowsAdded = await cacheStorage.into(cacheStorage.localeTable).insert(
      LocaleTableCompanion.insert(languageCode: l10nrEntity.locale.languageCode),
      // mode: InsertMode.insertOrReplace,
    );
    return rowsAdded >0;
  }
}