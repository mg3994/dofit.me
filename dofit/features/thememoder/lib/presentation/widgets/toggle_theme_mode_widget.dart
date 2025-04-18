// part of '../pages/theme_mode_page.dart';

// class ToggleThemeModeWidget extends StatelessWidget {
//   const ToggleThemeModeWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocSelector<ThemeModeBloc, ThemeModeState, ThemeMode>(
//       selector: (state) => state.themeModeEntity.themeMode,
//       builder: (context, themeMode) {
//         return Center(
//           child: GestureDetector(
//             onTap: () {
//               context
//                   .read<ThemeModeBloc>()
//                   .add(const ThemeModeEvent.toggleThemeMode());
//             },
//             child: Text(
//               themeMode.toString().split('.').last,
//               style: const TextStyle(fontSize: 100),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
////////////////
part of '../pages/theme_mode_page.dart';

class ToggleThemeModeWidget extends StatelessWidget {
  const ToggleThemeModeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ThemeModeBloc, ThemeModeState, ThemeMode>(
      selector: (state) => state.themeModeEntity.themeMode,
      builder: (context, currentMode) {
        // Resolve actual mode in case it's ThemeMode.system
        final brightness = MediaQuery.of(context).platformBrightness;
        final resolvedCurrentMode =
            currentMode == ThemeMode.system ? (brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light) : currentMode;

        final nextMode = resolvedCurrentMode == ThemeMode.dark
            ? ThemeMode.light
            : ThemeMode.dark;

        final icon = nextMode == ThemeMode.dark
            ? Icons.nightlight_round
            : Icons.wb_sunny;

        final color = nextMode == ThemeMode.dark
            ? Colors.blueGrey
            : Colors.orange;

        return Center(
          child: GestureDetector(
            onTap: () {
              context.read<ThemeModeBloc>().add(const ThemeModeEvent.toggleThemeMode());
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Icon(
                icon,
                size: 80,
                color: color,
              ),
            ),
          ),
        );
      },
    );
  }
}

