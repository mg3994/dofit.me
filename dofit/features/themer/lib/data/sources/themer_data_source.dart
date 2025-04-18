import 'package:themer/domain/entities/themer_entity.dart';

abstract interface class ThemerDataSource {
  const ThemerDataSource();
  Future<ThemerEntity> getThemer();
  Future<bool> setThemer(ThemerEntity themerEntity);
 
}