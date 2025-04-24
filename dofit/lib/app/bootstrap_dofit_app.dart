import 'package:dofit/app/dofit_app.dart' show DoFitApp;
import 'package:dofit/features/features.dart' show GetL10nrUseCase, GetThemeModeUseCase, GetThemerUseCase, L10nrBloc, L10nrLocalDataSource, L10nrRepository, L10nrRepositoryImpl, ResetThemeModeUseCase, SetL10nrUseCase, SetThemeModeUseCase, SetThemerUseCase, ThemeModeBloc, ThemeModeEvent, ThemeModeLocalDataSource, ThemeModeRepository, ThemeModeRepositoryImpl, ThemerBloc, ThemerEvent, ThemerLocalDataSource, ThemerRepository, ThemerRepositoryImpl,L10nrEvent;

import 'package:flutter/material.dart';
import 'package:core/core.dart';
import 'package:flutter/services.dart' show SystemChrome, SystemUiMode, SystemUiOverlay;

class BootstrapDofitApp extends StatefulWidget {
  const BootstrapDofitApp({super.key});

  @override
  State<BootstrapDofitApp> createState() => _BootstrapDofitAppState();
}

class _BootstrapDofitAppState extends State<BootstrapDofitApp> {
  late final CacheStorage _cacheStorage;

  @override
  void initState() {
    _cacheStorage = CacheStorage();
    // Edge to edge
    // WidgetsFlutterBinding.ensureInitialized();
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge,
        // overlays: [
        //   SystemUiOverlay.bottom,
        //   SystemUiOverlay.top,
        // ]
        );
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
     providers: [
        RepositoryProvider<ThemeModeRepository>(
          create:
              (context) => ThemeModeRepositoryImpl(
                ThemeModeLocalDataSource(cacheStorage: _cacheStorage),
              ),
        ),
        RepositoryProvider<ThemerRepository>(
          create:
              (context) => ThemerRepositoryImpl(
                ThemerLocalDataSource(cacheStorage: _cacheStorage),
              ),
        ),
        RepositoryProvider<L10nrRepository>(
          create:
              (context) => L10nrRepositoryImpl(
                L10nrLocalDataSource(cacheStorage: _cacheStorage),
              ),
        ),
      ],
      child: MultiBlocProvider(
          providers: [
          BlocProvider<ThemeModeBloc>(
            create:
                (context) => ThemeModeBloc(
                  getThemeModeUseCase: GetThemeModeUseCase(
                    themeModeRepository: context.read<ThemeModeRepository>(),
                  ),
                  setThemeModeUseCase: SetThemeModeUseCase(
                    themeModeRepository: context.read<ThemeModeRepository>(),
                  ),
                  resetThemeModeUseCase: ResetThemeModeUseCase(
                    themeModeRepository: context.read<ThemeModeRepository>(),
                  ),
                )..add(const ThemeModeEvent.getThemeMode()),
          ),
          BlocProvider<ThemerBloc>(
            create:
                (context) => ThemerBloc(
                  getThemerUseCase: GetThemerUseCase(
                    repository: context.read<ThemerRepository>(),
                  ),
                  setThemerUseCase: SetThemerUseCase(
                    repository: context.read<ThemerRepository>(),
                  ),
                )..add(const ThemerEvent.getThemer()),
          ),
          BlocProvider<L10nrBloc>(
            create:
                (context) => L10nrBloc(
                  getL10nrUseCase: GetL10nrUseCase(
                    repository: context.read<L10nrRepository>(),
                  ),
                  setL10nrUseCase: SetL10nrUseCase(
                    repository: context.read<L10nrRepository>(),
                  ),
                )..add(const L10nrEvent.getLocale()),
          ),
        ],
        child:   DoFitApp()),
      
    );
  }
}
