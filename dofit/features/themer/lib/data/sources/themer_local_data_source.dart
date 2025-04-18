import 'package:themer/data/sources/themer_data_source.dart';
import 'package:core/core.dart';
import 'package:themer/domain/entities/themer_entity.dart';
class ThemerLocalDataSource implements ThemerDataSource {
  final CacheStorage cacheStorage; // TODO: change to SharePreff or other as that gives bool

  const ThemerLocalDataSource({required this.cacheStorage});

  @override
  Future<ThemerEntity> getThemer() async {
    final record = await cacheStorage.select(cacheStorage.themeFlexSchemeTable).getSingleOrNull();
    if (record == null) {
      return ThemerEntity(flexScheme: FlexScheme.material);
      
    }
    return ThemerEntity(flexScheme: FlexScheme.values[record.flexSchemeIndex]);
  }

  @override
  Future<bool> setThemer(ThemerEntity themerEntity) async{
     // Delete old (only one record needed)
     await cacheStorage.delete(cacheStorage.themeFlexSchemeTable).go();
     final rowsAdded=await cacheStorage.into(cacheStorage.themeFlexSchemeTable).insert(
      ThemeFlexSchemeTableCompanion.insert(flexSchemeIndex: themerEntity.flexScheme.index)
     );
     return rowsAdded >0;
  }
}