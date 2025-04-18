import 'package:l10nr/domain/entities/l10nr_entity.dart';

abstract interface  class L10nrRepository {
  const L10nrRepository();
  Future<L10nrEntity> getLocale();
  Future<bool> setLocale(L10nrEntity l10nrEntity);

  
}