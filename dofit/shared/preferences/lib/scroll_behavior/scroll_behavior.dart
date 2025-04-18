import 'package:flutter/foundation.dart' show defaultTargetPlatform;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

final class AppScrollBehavior extends MaterialScrollBehavior {
  const AppScrollBehavior();
  @override
  Set<PointerDeviceKind> get dragDevices => super.dragDevices
    ..add(
      PointerDeviceKind.mouse,
    );
  // {
  //       PointerDeviceKind.touch,
  //       PointerDeviceKind.mouse,
  //       PointerDeviceKind.trackpad,
  //       PointerDeviceKind.stylus,
  //       PointerDeviceKind.invertedStylus,
  //       PointerDeviceKind.unknown
  //     };

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const BouncingScrollPhysics();
  }
}


/// AppScrollBehavior with no implicit scrollbars on any platform.
///
/// Useful with nested listviews that need to share scroll controller
@immutable
final class NoScrollbarBehavior extends AppScrollBehavior {
  const NoScrollbarBehavior();
  // Override for no scrollbars.
  @override
  Widget buildScrollbar(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}



/// Another alternative custom scroll behavior class.
/// Using the Apple iOS bouncing scroll and over stretch.
///
/// Currently not used in the example apps, but experimented with it, for
/// some other type of app it may be useful.
@immutable
class AppleScrollBehavior extends ScrollBehavior {
  const AppleScrollBehavior();

  @override
  Widget buildScrollbar(
          BuildContext context, Widget child, ScrollableDetails details) =>
      child;

  @override
  Widget buildOverscrollIndicator(
          BuildContext context, Widget child, ScrollableDetails details) =>
      child;

  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => super.dragDevices
    ..add(
      PointerDeviceKind.mouse,
    );

  @override
  TargetPlatform getPlatform(BuildContext context) => defaultTargetPlatform ;

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) =>
      const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics());
}