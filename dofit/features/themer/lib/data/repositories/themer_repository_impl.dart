
import 'package:themer/data/sources/themer_data_source.dart';
import 'package:themer/domain/entities/themer_entity.dart';
import 'package:themer/domain/repositories/themer_repository.dart';

final class ThemerRepositoryImpl implements ThemerRepository {
 const ThemerRepositoryImpl(this.themerDataSource);
 final ThemerDataSource themerDataSource;

  @override
  Future<ThemerEntity> getThemer() async{
   return await themerDataSource.getThemer();
  }

  @override
  Future<bool> setThemer(ThemerEntity themerEntity) async{
  return await themerDataSource.setThemer(themerEntity);
  }

}