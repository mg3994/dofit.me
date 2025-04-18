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
import 'package:l10nr/l10nr.dart';

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
                onMemoryPressure: () {
                  final ctx = rootNavigatorKey.currentContext;
                  if (ctx != null) {
                  showDialog(
                    context: ctx,
                    builder: (context) {
                    return AlertDialog(
                      title: const Text('Low Memory Warning'),
                      content: const Text(
                      'Your device is running low on memory. This may cause the app to crash on low-memory devices. '
                      'Please consider managing your phone storage to avoid potential issues.',
                      ),
                      actions: [
                      TextButton(
                        onPressed: () {
                        Navigator.of(context).pop(); // Close dialog
                        },
                        child: const Text('OK'),
                      ),
                      ],
                    );
                    },
                  );
                  }
                },
                onSystemLocaleChange: (
                  allSystemLocales,
                  systemPreferredLocale,
                ) {
                  if (AppLocalizationDelegate().isSupported(
                        systemPreferredLocale,
                      ) &&
                      (systemPreferredLocale !=
                          context.read<L10nrBloc>().state.l10nrEntity.locale)) {
                    final ctx = rootNavigatorKey.currentContext;
                    if (ctx != null) {
                      showDialog(
                        context: ctx,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Locale Change Detected'),
                            content: Text(
                              'We noticed your system locale has changed to ${systemPreferredLocale.languageCode}. '
                              'This locale is supported by our app. Would you like to switch to this locale?',
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop(); // Close dialog
                                },
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () {
                                  context.read<L10nrBloc>().add(
                                    L10nrEvent.setLocale(
                                      L10nrEntity(
                                        locale: systemPreferredLocale,
                                      ),
                                    ),
                                  );
                                  Navigator.of(context).pop(); // Close dialog
                                },
                                child: const Text('Switch'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  }
                },
                child: MaterialApp.router(
                  scrollBehavior:
                      const AppScrollBehavior(), // or NoScrollbarBehavior(), AppleScrollBehavior()
                  routerConfig: AppRouter.router,
                  supportedLocales: AppLocalizationDelegate().supportedLocales,
                  locale: context.watch<L10nrBloc>().state.l10nrEntity.locale,
                  localizationsDelegates: [
                    AppLocalizationDelegate(),
                    GlobalMaterialLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                  ],
                  localeResolutionCallback: (locale, supportedLocales) {
                    // Check if the locale is supported, otherwise fallback to the first supported locale
                    if (locale != null && supportedLocales.contains(locale)) {
                      return locale;
                    }
                    return supportedLocales.first;
                  },
                  localeListResolutionCallback: (locales, supportedLocales) {
                    // Iterate through the list of locales and return the first match
                    if (locales != null) {
                      for (final locale in locales) {
                        if (supportedLocales.contains(locale)) {
                          return locale;
                        }
                      }
                    }
                    // Fallback to the first supported locale if no match is found
                    return supportedLocales.first;
                  },

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
            },
          ),
        ),
      ),
    );
  }
}
