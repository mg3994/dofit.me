import 'package:flutter/cupertino.dart' show CupertinoThemeData;
import 'package:flutter/material.dart';
import 'package:packages/packages.dart';
import 'package:preferences/themes/theme_extensions.dart' show BrandTheme, darkBrandTheme, lightBrandTheme;

// Help link => ../../../../../AppData/Local/Pub/Cache/hosted/pub.dev/flex_color_scheme-8.2.0/example/lib/example_copy_paste_from_playground/app_theme.dart

// const List<Color> appThemeflexSchemeConstants = [
//   Colors.red,
//   Colors.blue,
//   Colors.green,
//   Colors.pink,
// ];
final List<FlexScheme> availableFlexSchemes = FlexScheme.values
    .where((scheme) => scheme != FlexScheme.custom)
    .toList();

ThemeData appLightTheme(FlexScheme flexScheme) => _appTheme(flexScheme:flexScheme, isDarkThemeMode:  false);

ThemeData appDarkTheme(FlexScheme flexScheme) => _appTheme(flexScheme:flexScheme, isDarkThemeMode:true);

ThemeData _appTheme({required FlexScheme flexScheme, required bool isDarkThemeMode, useM3= true}) {
  final baseTheme = isDarkThemeMode
      ? FlexThemeData.dark(useMaterial3: useM3, scheme:flexScheme,  // Component theme configurations for dark mode.
    subThemesData: const FlexSubThemesData(
      interactionEffects: true,
      tintedDisabledControls: true,
      blendOnColors: true,
      useM2StyleDividerInM3: true,
      inputDecoratorIsFilled: true,
      inputDecoratorBorderType: FlexInputBorderType.outline,
      alignedDropdown: true,
      navigationRailUseIndicator: true,
    ),
    // Direct ThemeData properties.
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),)
      : FlexThemeData.light(useMaterial3: useM3, scheme:flexScheme, // Component theme configurations for light mode.
    subThemesData: const FlexSubThemesData(
      interactionEffects: true,
      tintedDisabledControls: true,
      useM2StyleDividerInM3: true,
      inputDecoratorIsFilled: true,
      inputDecoratorBorderType: FlexInputBorderType.outline,
      alignedDropdown: true,
      navigationRailUseIndicator: true,
    ),
    // Direct ThemeData properties.
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),);
  return baseTheme.copyWith(
    // brightness: isDarkThemeMode ? Brightness.dark : Brightness.light, // Only this thing seprates out the light and dark above
    // colorScheme: ColorScheme.fromSeed(flexScheme: flexScheme),
    // scaffoldBackgroundColor:
    //     isDarkThemeMode ? const Color(0xFF303030) : const Color(0xFFf5f5f5),
    // bannerTheme: isDarkThemeMode
    //     ? const MaterialBannerThemeData(backgroundColor: Colors.black)
    //     : const MaterialBannerThemeData(backgroundColor: Colors.white),
    // iconTheme: IconThemeData(
    //   color: isDarkThemeMode ? Colors.white70 : Colors.black,
    // ),
    // textTheme: TextTheme( // Do add More
    //   bodySmall:
    //       TextStyle(color: isDarkThemeMode ? Colors.white70 : Colors.black),
    //   bodyMedium:
    //       TextStyle(color: isDarkThemeMode ? Colors.white70 : Colors.black),
    // ),
    extensions: [
      // AppTheme(isDarkThemeMode: isDarkThemeMode, flexScheme: flexScheme),
      BrandTheme(brandColor :isDarkThemeMode ? darkBrandTheme.brandColor: lightBrandTheme.brandColor )
    ],
  );
}
