import 'package:thememoder/domain/entity/theme_mode_entity.dart';

enum ThemeModeStatus {
  initial,loading,success,error
  
}

class ThemeModeState {
  final ThemeModeStatus status;
  final String? errorMessage;
  final ThemeModeEntity? themeModeEntity;
  const ThemeModeState._({
    required this.status,
    this.errorMessage,
    this.themeModeEntity
  });
  factory ThemeModeState.initial()=> ThemeModeState._(status: ThemeModeStatus.initial);
  ThemeModeState copyWith({ThemeModeStatus? status, String? errorMessage, ThemeModeEntity? themeModeEntity})=> ThemeModeState._(status: status ?? this.status,errorMessage: errorMessage ?? this.errorMessage,themeModeEntity: themeModeEntity??this.themeModeEntity);
}