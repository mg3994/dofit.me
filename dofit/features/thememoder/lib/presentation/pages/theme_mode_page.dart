

import 'package:flutter/material.dart';


import 'package:thememoder/data/datasource/theme_mode_data_source.dart';
import 'package:thememoder/data/datasource/theme_mode_local_data_source.dart';

import 'package:core/core.dart' hide Column;
import 'package:thememoder/data/repository/theme_mode_repository_impl.dart';
import 'package:thememoder/domain/repository/theme_mode_repository.dart';
import 'package:thememoder/domain/usecase/get_theme_mode_use_case.dart';
import 'package:thememoder/domain/usecase/reset_theme_mode_use_case.dart';
import 'package:thememoder/domain/usecase/set_theme_mode_use_case.dart';
import '../bloc/theme_mode_bloc.dart';

part '../widgets/toggle_theme_mode_widget.dart';
part '../widgets/reset_theme_mode_snackbar.dart';



class ThemeModePage extends StatelessWidget {
  const ThemeModePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cacheStorage = CacheStorage();
      final ThemeModeDataSource themeModeDatasource = ThemeModeLocalDataSource(cacheStorage: cacheStorage);
    final ThemeModeRepository themeModeRepository =
        ThemeModeRepositoryImpl(themeModeDatasource);
    final GetThemeModeUseCase getThemeModeUseCase =
        GetThemeModeUseCase(themeModeRepository:themeModeRepository );
    final SetThemeModeUseCase setThemeModeUseCase =
        SetThemeModeUseCase(themeModeRepository: themeModeRepository);
    final ResetThemeModeUseCase resetThemeModeUseCase =
        ResetThemeModeUseCase(themeModeRepository: themeModeRepository);
    return BlocProvider(
      create: (context) => ThemeModeBloc(
        getThemeModeUseCase: getThemeModeUseCase,
        setThemeModeUseCase: setThemeModeUseCase,
        resetThemeModeUseCase: resetThemeModeUseCase,
      )..add(const ThemeModeEvent.getThemeMode()),
      child: ResetThemeModeSnackbar(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Theme Mode'),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
      
                const Text(
                  'Toggle Theme',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Tap the icon below to switch between light and dark theme. '
                  'Your current preference will be saved.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 32),
      
                const ToggleThemeModeWidget(),
      
                const Spacer(),
      
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: () {
                      context.read<ThemeModeBloc>().add(
                            const ThemeModeEvent.resetThemeMode(),
                          );
                    },
                    icon: const Icon(Icons.restore),
                    label: const Text('Reset to System Default'),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
