import 'package:flutter/material.dart';

const List<Color> appThemeSeedColorConstants = [
  Colors.red,
  Colors.blue,
  Colors.green,
  Colors.pink,
];

ThemeData appLightTheme(Color seedColor) => _appTheme(seedColor:seedColor, isDarkThemeMode:  false);

ThemeData appDarkTheme(Color seedColor) => _appTheme(seedColor:seedColor, isDarkThemeMode:true);

ThemeData _appTheme({required Color seedColor, required bool isDarkThemeMode, isM3= true}) {
  final baseTheme = isDarkThemeMode
      ? ThemeData.dark(useMaterial3: isM3)
      : ThemeData.light(useMaterial3: isM3);
  return baseTheme.copyWith(
    brightness: isDarkThemeMode ? Brightness.dark : Brightness.light,
    colorScheme: ColorScheme.fromSeed(seedColor: seedColor),
    scaffoldBackgroundColor:
        isDarkThemeMode ? const Color(0xFF303030) : const Color(0xFFf5f5f5),
    bannerTheme: isDarkThemeMode
        ? const MaterialBannerThemeData(backgroundColor: Colors.black)
        : const MaterialBannerThemeData(backgroundColor: Colors.white),
    iconTheme: IconThemeData(
      color: isDarkThemeMode ? Colors.white70 : Colors.black,
    ),
    textTheme: TextTheme( // Do add More
      bodySmall:
          TextStyle(color: isDarkThemeMode ? Colors.white70 : Colors.black),
      bodyMedium:
          TextStyle(color: isDarkThemeMode ? Colors.white70 : Colors.black),
    ),
    extensions: <AppTheme>[
      AppTheme(isDarkThemeMode: isDarkThemeMode, seedColor: seedColor),
    ],
  );
}

final class AppTheme extends ThemeExtension<AppTheme> {
  final bool isDarkThemeMode;
  final Color seedColor;
  final Color appColor0;
  final Color appColor1;
  final Color appColor2;

  AppTheme({
    required this.isDarkThemeMode,
    required this.seedColor,
  })  : appColor0 = _adjustColor(seedColor, isDarkThemeMode, 50, 10),
        appColor1 = _adjustColor(seedColor, isDarkThemeMode, 50, 10),
        appColor2 = _adjustColor(seedColor, isDarkThemeMode, 50, 10);

  static Color _adjustColor(
      Color color, bool isDark, int darkValue, int lightValue) {
    return isDark ? color.withAlpha(darkValue) : color.withAlpha(lightValue);
  }

  static AppTheme of(BuildContext context) {
    return Theme.of(context).extension<AppTheme>()!;
  }

  @override
  AppTheme copyWith({
    bool? isDarkThemeMode,
    Color? seedColor,
    Color? appColor0, // TODO: Change Names as per Need
    Color? appColor1, // TODO: Change Names as per Need
    Color? appColor2, // TODO: Change Names as per Need
  }) {
    return AppTheme(
      isDarkThemeMode: isDarkThemeMode ?? this.isDarkThemeMode,
      seedColor: seedColor ?? this.seedColor,
    );
  }

  @override
  AppTheme lerp(
      covariant ThemeExtension<AppTheme> other, double t) {
    if (other is! AppTheme) return this;
    return AppTheme(
      isDarkThemeMode: isDarkThemeMode,
      seedColor: Color.lerp(seedColor, other.seedColor, t)!,
    );
  }
}
