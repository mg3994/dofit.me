import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../features/auth/domain/usecases/get_current_token.dart';

class AuthGuard extends StatefulWidget {
  final Widget child;
  final String guardedRoute;
  
  const AuthGuard({
    super.key, 
    required this.child,
    required this.guardedRoute,
  });

  @override
  State<AuthGuard> createState() => _AuthGuardState();
}

class _AuthGuardState extends State<AuthGuard> {
  bool _isLoading = true;
  bool _isAuthenticated = false;

  @override
  void initState() {
    super.initState();
    _checkAuth();
  }

  Future<void> _checkAuth() async {
    // Use the updated use case which now uses TokenProvider
    final getCurrentToken = GetIt.instance<GetCurrentTokenUseCase>();
    final result = await getCurrentToken();
    
    setState(() {
      _isLoading = false;
      _isAuthenticated = result.isRight();
    });
    
    if (!_isAuthenticated && mounted) {
      // If not authenticated, redirect to login with return URL
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).pushReplacementNamed(
          '/login',
          arguments: {'returnUrl': widget.guardedRoute},
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    
    if (_isAuthenticated) {
      return widget.child;
    }
    
    // This should not be visible as we navigate away in _checkAuth
    return const Scaffold(
      body: Center(
        child: Text('Authentication required'),
      ),
    );
  }
}