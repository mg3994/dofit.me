import 'package:dofit/route/auth_guard.dart';
import 'package:dofit/route/route_definition.dart';
import 'package:dofit/features/auth/presentation/pages/login_screen.dart';
import 'package:dofit/home_screen.dart';
import 'package:flutter/material.dart';

class RouteManager {
  static final List<RouteDefinition> routes = [
    // Public routes
    RouteDefinition(
      path: '/login',
      builder: (context) => const LoginScreen(),
      requiresAuth: false,
    ),
    RouteDefinition(
      path: '/about',
      builder: (context) => Container(),
      requiresAuth: false,
    ),
    RouteDefinition(
      path: '/products',
      builder: (context) => Container(),
      requiresAuth: false,
    ),

    // Protected routes
    RouteDefinition(
      path: '/profile',
      builder: (context) => Container(),
      requiresAuth: true,
    ),
    RouteDefinition(
      path: '/orders',
      builder: (context) => Container(),
      requiresAuth: true,
    ),
    RouteDefinition(
      path: '/settings',
      builder: (context) => Container(),
      requiresAuth: true,
    ),

    // Home route
    RouteDefinition(
      path: '/',
      builder: (context) => const HomeScreen(),
      requiresAuth: false,
    ),
  ];

  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Find the route definition
    final routeDefinition = routes.firstWhere(
      (route) => route.path == settings.name,
      orElse:
          () => RouteDefinition(
            path: '/not-found',
            builder:
                (context) => Scaffold(
                  body: Center(
                    child: Text('Route not found: ${settings.name}'),
                  ),
                ),
          ),
    );

    // If route requires authentication, check auth status
    if (routeDefinition.requiresAuth) {
      return MaterialPageRoute(
        builder:
            (context) => AuthGuard(
              guardedRoute: routeDefinition.path,
              child: Builder(builder: routeDefinition.builder),
            ),
      );
    }

    // Public route, no auth check needed
    return MaterialPageRoute(
      builder: routeDefinition.builder,
      settings: settings,
    );
  }
}
