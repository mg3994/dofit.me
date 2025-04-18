// LicenseRegistry.addLicense(() async* {
//   final String license =
//       await rootBundle.loadString('assets/google_fonts/OFL.txt');
//   yield LicenseEntryWithLineBreaks(<String>['google_fonts'], license);
// });

import 'package:dofit/router/app_router.dart' show AppRouter;
import 'package:flutter/material.dart';
import 'package:core/core.dart';
import 'package:components/components.dart';
// Features
import 'package:thememoder/thememoder.dart';
import 'package:themer/themer.dart';

void main() {
  runApp(const DoFitApp());
}

class DoFitApp extends StatefulWidget {
  const DoFitApp({super.key});

  @override
  State<DoFitApp> createState() => _DoFitAppState();
}

class _DoFitAppState extends State<DoFitApp> {
  late final CacheStorage _cacheStorage;

  @override
  void initState() {
    super.initState();
    _cacheStorage = CacheStorage();
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
        ],
        child: MultiBlocListener(
          listeners: [
            BlocListener<ThemeModeBloc, ThemeModeState>(
              listenWhen:
                  (previous, current) =>
                      previous.themeModeEntity.themeMode == ThemeMode.system &&
                      current.themeModeEntity.themeMode != ThemeMode.system,
              listener: (BuildContext context, ThemeModeState state) {
                final ctx = rootNavigatorKey.currentContext;
                if (ctx != null) {
                  ScaffoldMessenger.of(ctx).showSnackBar(
                    SnackBar(
                      content: const Text('Theme mode updated'),
                      action: SnackBarAction(
                        label: 'Reset',
                        onPressed: () {
                          context.read<ThemeModeBloc>().add(
                            const ThemeModeEvent.resetThemeMode(),
                          );
                        },
                      ),
                    ),
                  );
                }
              },
            ),
          ],
          child: Builder(
            builder: (context) {
              return SystemEventObserver(
                child: MaterialApp.router(
                  routerConfig: AppRouter.router,
                  theme: appLightTheme(
                    context.watch<ThemerBloc>().state.themerEntity.flexScheme,
                  ),
                  darkTheme: appDarkTheme(
                    context.watch<ThemerBloc>().state.themerEntity.flexScheme,
                  ),
                  themeMode:
                      context
                          .watch<ThemeModeBloc>()
                          .state
                          .themeModeEntity
                          .themeMode, // Get the current theme mode from the bloc
                ),
              );
            }
          ),
        ),
      ),
    );
  }
}
