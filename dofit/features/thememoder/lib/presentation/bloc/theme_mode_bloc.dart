import 'package:packages/packages.dart';
import 'package:thememoder/domain/usecase/get_theme_mode_use_case.dart';
import 'package:thememoder/domain/usecase/set_theme_mode_use_case.dart';
import 'package:thememoder/presentation/bloc/theme_mode_events.dart';
import 'package:thememoder/presentation/bloc/theme_mode_state.dart';
final class ThemeModeBloc extends  Bloc<ThemeModeEvent, ThemeModeState> {
  const ThemeModeBloc({required this.getThemeModeUseCase,required this.setThemeModeUseCase}):super(ThemeModeState.initial()){
    on<GetThemeModeEvent>();
    on<ToggleThemeModeEvent>();
  }
  final GetThemeModeUseCase getThemeModeUseCase ;
  final SetThemeModeUseCase setThemeModeUseCase ;
}