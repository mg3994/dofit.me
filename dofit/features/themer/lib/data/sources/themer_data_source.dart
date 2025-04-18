import 'package:themer/domain/entities/themer_entity.dart';

abstract interface class ThemerDataSource {
  const ThemerDataSource();
  Future<bool> setThemer(ThemerEntity themerEntity);
  Future<ThemerEntity> getThemer();
 
}