import 'dart:developer';

import 'package:dofit/config.dart';
import 'package:dofit/features/auth/presentation/bloc/logout/logout_bloc.dart';
import 'package:dofit/features/auth/presentation/bloc/logout/logout_event.dart';
import 'package:dofit/features/auth/presentation/bloc/logout/logout_state.dart';
import 'package:dofit/features/catalog/domain/entities/category.dart';
import 'package:dofit/features/catalog/domain/usecases/get_categories_usecase.dart';
import 'package:dofit/features/catalog/domain/usecases/get_workouts_usecase.dart';
import 'package:dofit/features/catalog/presentation/pages/workouts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class _MenuOption {
  final String value;
  final String label;
  final IconData? icon;
  final Function(BuildContext) onSelected;

  const _MenuOption({
    required this.value,
    required this.label,
    this.icon,
    required this.onSelected,
  });
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLoading = false;
  String _error = '';
  List<Category> _categories = [];

  final _getCategoriesUseCase = GetIt.instance<GetCategoriesUseCase>();
  final _getWorkoutsUseCase = GetIt.instance<GetWorkoutsUseCase>();
  final _config = GetIt.instance<AppConfig>();

  void _onItemTapped(int index) async {
    setState(() {
      _selectedIndex = index;
    });

    // If the "Palestra" tab is selected (index 1), load its categories
    if (index == 1) {
      await _loadCategories(_config.wordPressConfig.fitnessRootCategoryId);
      log(_categories.toString());
    }
    // You can add similar conditions for other tabs if needed
  }

  Future<void> _loadCategories(int parentId) async {
    setState(() {
      _isLoading = true;
      _error = '';
    });

    try {
      final result = await _getCategoriesUseCase(parentId);
      final workouts = await _getWorkoutsUseCase(parentId);
      log(workouts.toString());

      setState(() {
        _isLoading = false;
        result.fold(
          (failure) => _error = failure.message,
          (categories) => _categories = categories,
        );
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _error = e.toString();
      });
    }
  }

  int _selectedIndex = 0;
  List<_MenuOption> _menuOptions() {
    return [
      _MenuOption(
        value: 'profile',
        label: 'Profilo',
        icon: Icons.person,
        onSelected: (context) => Navigator.of(context).pushNamed('/profile'),
      ),
      _MenuOption(
        value: 'orders',
        label: 'Ordini',
        icon: Icons.settings,
        onSelected: (context) => Navigator.of(context).pushNamed('/orders'),
      ),
      _MenuOption(
        value: 'membership',
        label: 'Membership',
        icon: Icons.settings,
        onSelected: (context) => Navigator.of(context).pushNamed('/membership'),
      ),
      _MenuOption(
        value: 'subscriptions',
        label: 'Abbonamenti',
        icon: Icons.settings,
        onSelected: (context) => Navigator.of(context).pushNamed('/subscriptions'),
      ),
       _MenuOption(
        value: 'addresses',
        label: 'Indirizzi',
        icon: Icons.settings,
        onSelected: (context) => Navigator.of(context).pushNamed('/addresses'),
      ),
      _MenuOption(
        value: 'logout',
        label: 'Logout',
        icon: Icons.logout,
        onSelected: (context) {
          showDialog(
            context: context,
            builder:
                (dialogContext) => AlertDialog(
                  title: const Text('Logout'),
                  content: const Text('Are you sure you want to logout?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(dialogContext).pop(),
                      child: const Text('Cancel'),
                    ),
                    BlocProvider(
                      create: (context) => GetIt.instance<LogoutBloc>(),
                      child: BlocConsumer<LogoutBloc, LogoutState>(
                        listener: (context, state) {
                          if (state is LogoutSuccess) {
                            Navigator.of(dialogContext).pop();
                            Navigator.of(
                              context,
                            ).pushReplacementNamed('/login');
                          } else if (state is LogoutFailure) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(state.message)),
                            );
                          }
                        },
                        builder: (context, state) {
                          return TextButton(
                            onPressed:
                                state is LogoutLoading
                                    ? null
                                    : () {
                                      context.read<LogoutBloc>().add(
                                        LogoutRequested(),
                                      );
                                    },
                            child:
                                state is LogoutLoading
                                    ? const SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                      ),
                                    )
                                    : const Text('Logout'),
                          );
                        },
                      ),
                    ),
                  ],
                ),
          );
        },
      ),
    ];
  }

  // Placeholder screens for each tab
  final List<Widget> _screens = [
    const Center(child: Text('Bacheca', style: TextStyle(fontSize: 24))), // Bacheca
    const Center(child: Workouts()), // Palestra
    const Center(child: Text('Cucina Sana', style: TextStyle(fontSize: 24))), // Cucina sana
    const Center(
      child: Text('Centro Benessere', style: TextStyle(fontSize: 24)),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.asset(
          'assets/images/logo.png', // Replace with your actual image filename
          height: 40, // Adjust height as needed
          fit: BoxFit.contain,
        ),
        actions: [
          // Cart Icon
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            color: Colors.white,
            onPressed: () {
              // Handle cart tap
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('Cart tapped')));
            },
          ),
          // User Menu
          PopupMenuButton<String>(
            icon: const Icon(Icons.account_circle),
            color: Colors.white,
            onSelected: (value) {
              final option = _menuOptions().firstWhere(
                (option) => option.value == value,
                orElse: () => throw Exception('Option not found: $value'),
              );
              option.onSelected(context);
            },
            itemBuilder: (BuildContext context) {
              return _menuOptions().map((option) {
                return PopupMenuItem<String>(
                  value: option.value,
                  child: Row(
                    children: [
                      if (option.icon != null) ...[
                        Icon(option.icon, size: 20),
                        const SizedBox(width: 10),
                      ],
                      Text(option.label),
                    ],
                  ),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Important for more than 3 items
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: 'Palestra',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.kitchen),
            label: 'Cucina Sana',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.spa),
            label: 'Centro Benessere',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_collection),
            label: 'Video Guide',
          ),
        ],
      ),
    );
  }
}
