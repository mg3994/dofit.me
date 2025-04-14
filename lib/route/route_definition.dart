import 'package:flutter/material.dart';

class RouteDefinition {
  final String path;
  final WidgetBuilder builder;
  final bool requiresAuth;

  const RouteDefinition({
    required this.path,
    required this.builder,
    this.requiresAuth = false,
  });
}
