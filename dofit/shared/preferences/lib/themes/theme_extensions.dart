import 'package:flutter/material.dart' show BuildContext, Color, Theme, ThemeExtension;

/// A theme Extension example with a single custom brand color property.
///
/// You can add as many colors and other theme properties as you need, and
/// you can add multiple different ThemeExtension sub classes as well.
class BrandTheme extends ThemeExtension<BrandTheme> {
  const BrandTheme({
    this.brandColor,
  });
  final Color? brandColor;

  static BrandTheme of(BuildContext context) {
    return Theme.of(context).extension<BrandTheme>()!;
  }


  // You must override the copyWith method.
  @override
  BrandTheme copyWith({
    Color? brandColor,
  }) =>
      BrandTheme(
        brandColor: brandColor ?? this.brandColor,
      );

  // You must override the lerp method.
  @override
  BrandTheme lerp(ThemeExtension<BrandTheme>? other, double t) {
    if (other is! BrandTheme) {
      return this;
    }
    return BrandTheme(
      brandColor: Color.lerp(brandColor, other.brandColor, t),
    );
  }
}

// Custom const theme with our brand color in light mode.
const BrandTheme lightBrandTheme = BrandTheme(
  brandColor: Color.fromARGB(255, 8, 79, 71),
);

// Custom const theme with our brand color in dark mode.
const BrandTheme darkBrandTheme = BrandTheme(
  brandColor: Color.fromARGB(255, 167, 227, 218),
);



///////////////////////////////////////////

// final class AppTheme extends ThemeExtension<AppTheme> {
//   final bool isDarkThemeMode;
//   final FlexScheme flexScheme;
//   final Color appColor0; // TODO: Change Names
//   final Color appColor1; // TODO: Change Names
//   final Color appColor2; // TODO: Change Names

//   AppTheme({
//     required this.isDarkThemeMode,
//     required this.flexScheme,
//   })  : appColor0 = _adjustColor(isDarkThemeMode? flexScheme.data.dark.primary :flexScheme.data.light.primary,50),
//         appColor1 =  _adjustColor(isDarkThemeMode? flexScheme.data.dark.primary :flexScheme.data.light.primary,50),
//         appColor2 =  _adjustColor(isDarkThemeMode? flexScheme.data.dark.primary :flexScheme.data.light.primary,50);

//   static Color _adjustColor(
//       Color color,int value) {
//     return color.withAlpha(value) ;
//   }

//   static AppTheme of(BuildContext context) {
//     return Theme.of(context).extension<AppTheme>()!;
//   }

//   @override
//   AppTheme copyWith({
//     bool? isDarkThemeMode,
//     FlexScheme? flexScheme,
//     Color? appColor0, // TODO: Change Names as per Need
//     Color? appColor1, // TODO: Change Names as per Need
//     Color? appColor2, // TODO: Change Names as per Need
//   }) {
//     return AppTheme(
//       isDarkThemeMode: isDarkThemeMode ?? this.isDarkThemeMode,
//       flexScheme: flexScheme ?? this.flexScheme,
//     );
//   }

//   @override
//   AppTheme lerp( // used while Changing theme
//       covariant ThemeExtension<AppTheme> other, double t) {
//     if (other is! AppTheme) return this;
//     return AppTheme(
//       isDarkThemeMode: isDarkThemeMode,
//       flexScheme: other.flexScheme, 
      
//       // TODO: Make a lerp method
//       // Color.lerp(flexScheme.data., other.flexScheme, t)!,
//     );
//   }
// }
