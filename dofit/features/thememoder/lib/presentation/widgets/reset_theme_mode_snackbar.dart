part of '../pages/theme_mode_page.dart';

class ResetThemeModeSnackbar extends StatelessWidget {
  final Widget child ;

  const ResetThemeModeSnackbar({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ThemeModeBloc, ThemeModeState>(
    listenWhen: (previous, current) =>
          previous.themeModeEntity.themeMode == ThemeMode.system &&
          current.themeModeEntity.themeMode != ThemeMode.system,
  listener: (context, state) {
    //  id old state has theme mode system and new state has any other theme mode then only show snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Theme mode updated'),
        action: SnackBarAction(
          label: 'Reset',
          onPressed: () {
            context.read<ThemeModeBloc>().add(const ThemeModeEvent.resetThemeMode());
          },
        ),
      ),
    );
    },
  child: child,
);
  }
}
