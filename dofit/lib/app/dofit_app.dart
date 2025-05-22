import 'package:dofit/features/features.dart'
    show
        L10nrBloc,
        L10nrEntity,
        L10nrEvent,
        ThemeModeBloc,
        ThemeModeEvent,
        ThemeModeState,
        ThemerBloc;
import 'package:dofit/router/app_router.dart' show AppRouter;
import 'package:flutter/material.dart';
import 'package:core/core.dart';
import 'package:components/components.dart';
import 'dart:ui' as ui;

import 'package:flutter/services.dart' show SystemUiOverlayStyle;
// on did change allow first frame also do precatch assets
class DoFitApp extends StatelessWidget {
  const DoFitApp({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMemoryDialogShown = false;

    return MaterialApp.router(
      // scrollBehavior:
      //     const AppleScrollBehavior() ,//AppScrollBehavior(), // or NoScrollbarBehavior(), AppleScrollBehavior()
      routerConfig: AppRouter.router,
      supportedLocales: S.delegate.supportedLocales,
      locale: context.watch<L10nrBloc>().state.l10nrEntity.locale,
      localizationsDelegates: [
        S.delegate,
        // AppLocalizationDelegate(),
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
      builder: (context, child) {
        return MultiBlocListener(
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
                      content: const Text(
                        'Want a Switch Back to System Theme Mode',
                      ),
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
          child: AnnotatedRegion(
            value:  SystemUiOverlayStyle(
              statusBarColor: Colors.transparent, //TODO Change
              systemNavigationBarColor: Colors.transparent,
              // systemNavigationBarIconBrightness:Theme.of(context).brightness == Brightness.dark? Brightness.dark: Brightness.light,
              // statusBarIconBrightness: Theme.of(context).brightness == Brightness.dark? Brightness.dark:Brightness.light,
            ),
            child: SystemEventObserver(
              onSystemBrightnessChange: (systemBrightness) {
                final appCurrentThemeMode =
                    context
                        .read<ThemeModeBloc>()
                        .state
                        .themeModeEntity
                        .themeMode; // Get the current theme mode from the bloc
                final ctx = rootNavigatorKey.currentContext;
                // Map themeMode to Brightness
                systemBrightnessToThemeMode() => switch (systemBrightness) {
                  Brightness.light => ThemeMode.light,
                  Brightness.dark => ThemeMode.dark,
                };
                if (ctx != null &&
                    appCurrentThemeMode != ThemeMode.system &&
                    systemBrightnessToThemeMode() != appCurrentThemeMode) {
                  // TODO: may or may not Remove simillar Snackbar if already there
                  ScaffoldMessenger.of(ctx).showSnackBar(
                    SnackBar(
                      content: const Text('Wish To Change App Theme Mode'),
                      action: SnackBarAction(
                        label: 'Switch',
                        onPressed: () {
                          context.read<ThemeModeBloc>().add(
                            const ThemeModeEvent.toggleThemeMode(),
                          );
                        },
                      ),
                    ),
                  );
                }
              },
              onAppExitRequest: () async {
                // Triggered Mainly on Web and Desktop Devices
                // You can keep this for desktop/web system exit events
                final ctx = rootNavigatorKey.currentContext;
                if (ctx != null) {
                  final shouldExit = await showDialog<bool>(
                    context: ctx,
                    builder:
                        (context) => AlertDialog(
                          title: const Text('Exit App'),
                          content: const Text(
                            'Do you really want to exit the app?',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(false),
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(true),
                              child: const Text('Exit'),
                            ),
                          ],
                        ),
                  );
                  return shouldExit == true
                      ? ui.AppExitResponse.exit
                      : ui.AppExitResponse.cancel;
                }
                return ui.AppExitResponse.cancel;
              },
              onMemoryPressure: () {
                final ctx = rootNavigatorKey.currentContext;
                if (ctx != null && !isMemoryDialogShown) {
                  isMemoryDialogShown = true; // Lock
                  showDialog(
                    context: ctx,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Low Memory Warning'),
                        content: const Text(
                          'Your device is running low on available memory (RAM). This may affect app performance or cause crashes on low-memory devices. '
                          'Please consider closing unused apps or freeing up memory to avoid potential issues with this app.',
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
                  ).then((_) {
                    isMemoryDialogShown = false; // Unlock after closed
                  });
                }
              },
              onSystemLocaleChange: (allSystemLocales, systemPreferredLocale) {
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
                                    L10nrEntity(locale: systemPreferredLocale),
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
              child:
                  (child != null)
                      ? child
                      : FlutterLogo(), //TODO: Chnge with Error Page
            ),
          ),
        );
      },
    );
  }
}
