import 'package:l10nr/data/sources/l10nr_data_source.dart';
import 'package:l10nr/domain/entities/l10nr_entity.dart';
import 'package:l10nr/domain/repositories/l10nr_repository.dart';

final class L10nrRepositoryImpl implements L10nrRepository {
  const L10nrRepositoryImpl(this.l10nrDataSource);
  final L10nrDataSource l10nrDataSource;

  @override
  Future<L10nrEntity> getLocale()async {
   return await l10nrDataSource.getLocale();
  }

  @override
  Future<bool> setLocale(L10nrEntity l10nrEntity) async{
    return await l10nrDataSource.setLocale(l10nrEntity);
  }
}