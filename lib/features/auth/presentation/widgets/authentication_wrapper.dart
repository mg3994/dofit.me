import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../domain/usecases/get_current_token.dart';

class AuthenticationWrapper extends StatefulWidget {
  const AuthenticationWrapper({super.key});

  @override
  State<AuthenticationWrapper> createState() => _AuthenticationWrapperState();
}

class _AuthenticationWrapperState extends State<AuthenticationWrapper> {
  @override
  void initState() {
    super.initState();
    _checkAuthAndRedirect();
  }

  Future<void> _checkAuthAndRedirect() async {
    // Use the updated use case which now uses TokenProvider
    final getCurrentToken = GetIt.instance<GetCurrentTokenUseCase>();
    final result = await getCurrentToken();
    
    // You can check the result if needed
    if (result.isRight()) {
      // Successfully got token
    }
    
    // Always navigate to home - protected routes will be handled by AuthGuard
    if (!mounted) return;
    Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}