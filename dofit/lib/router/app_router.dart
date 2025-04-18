import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:thememoder/thememoder.dart';
import 'package:themer/themer.dart';

import 'package:core/core.dart' hide Column;


// GoRouter configuration
class AppRouter {
  const AppRouter();
  

static final router = GoRouter(
  navigatorKey: rootNavigatorKey, // ✅ inject it here
  initialLocation: '/settings',
  routes: [
    GoRoute(
      name: 'thememode', // Optional, add name to your routes. Allows you navigate by name instead of path
      path: '/thememode',
      builder: (context, state) => Scaffold(body:BlocSelector<ThemeModeBloc, ThemeModeState, ThemeMode>(
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
            ? Icons.wb_sunny:Icons.nightlight_round
            ;

        final color = nextMode == ThemeMode.dark
            ? Colors.orange:Colors.blueGrey
           ;

        return Column(
          children: [
            Text(
                    'Current mode: ${resolvedCurrentMode.toString().split('.').last}',
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
            Center(
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
            ),
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
          ],
        );
      },
    ) ),
    ),
     GoRoute(
      name: 'themer', // Optional, add name to your routes. Allows you navigate by name instead of path
      path: '/themer',
      builder: (context, state) => Scaffold(
        body: ListView.builder(
          itemCount: availableFlexSchemes.length ,
          itemBuilder: (context, index){
            return GestureDetector(
              onTap: () =>  context.read<ThemerBloc>().add( ThemerEvent.setThemer(ThemerEntity(flexScheme:availableFlexSchemes[index] ))),
              child: ListTile(title: Text(availableFlexSchemes[index].name),));
          })
        //  i have a list of flex themestored here final List<FlexScheme> availableFlexSchemes = FlexScheme.values
    // .where((scheme) => scheme != FlexScheme.custom)
    // .toList(); show as a list view
    // context.read<ThemerBloc>(). add that event of seting theme
      )),
    GoRoute(
      name: 'settings',
      path: '/settings',
      builder: (context, state) => Scaffold(body: Column(children: [
        OutlinedButton(onPressed: ()=> context.push('/thememode'), child: Text('/thememode')),
        OutlinedButton(onPressed: ()=> context.push('/themer'), child: Text('/themer'))

      ],),),
    ),
  ],
);

}