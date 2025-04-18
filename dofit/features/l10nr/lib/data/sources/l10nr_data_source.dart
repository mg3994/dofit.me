import 'package:l10nr/domain/entities/l10nr_entity.dart';

abstract interface class L10nrDataSource {
  const L10nrDataSource();
  Future<L10nrEntity> getLocale();
  Future<bool> setLocale(L10nrEntity l10nrEntity);
}