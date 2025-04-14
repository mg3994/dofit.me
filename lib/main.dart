import 'package:dofit/features/auth/domain/usecases/get_current_token.dart';
import 'package:dofit/home_screen.dart';
import 'package:dofit/route/route_manager.dart';
import 'package:flutter/material.dart';
import 'boot/init_di.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize dependency injection
  await di.initializeDependencies();
  // Check auth outside of widget tree
  await _preloadAuthState();
  runApp(const MainApp());
}

Future<void> _preloadAuthState() async {
  // This just ensures token is checked and stored where needed
  final getCurrentToken = di.sl.get<GetCurrentTokenUseCase>();
  await getCurrentToken();
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomeScreen(),
      onGenerateRoute: RouteManager.generateRoute,
    );
  }
}
