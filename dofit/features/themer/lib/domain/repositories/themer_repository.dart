// TODO: Themer 기능에 대한 리포지토리 인터페이스를 정의하세요.
import 'package:themer/domain/entities/themer_entity.dart' show ThemerEntity;

abstract interface class ThemerRepository {
  const ThemerRepository();
  Future<ThemerEntity> getThemer();
  Future<bool> setThemer(ThemerEntity themerEntity);
}