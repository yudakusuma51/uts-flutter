import 'package:flutter/material.dart';
import 'login-screen.dart';
import 'forgot-password-screen.dart';
import 'dashboard-screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/forgot': (context) => ForgotPasswordScreen(),
        '/dashboard': (context) => DashboardScreen(),
      },
    );
  }
}
